import { HttpService } from '@nestjs/axios';
import { Injectable } from '@nestjs/common';
import axios from 'axios';
import { PrismaService } from 'src/database/PrismaServices';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { ContractDto } from './dto/contract.dot';

const { email, publickey, apikey } = process.env;

const login = () => {
  return axios.post(`https://api2.eduzz.com/credential/generate_token`, {
    email: email,
    publickey: publickey,
    apikey: apikey,
  });
};

@Injectable()
export class UsersService {
  constructor(
    private prisma: PrismaService,
    private readonly httpService: HttpService,
  ) {}
  async create(createUserDto: CreateUserDto) {
    const user = await this.prisma.user.create({
      data: createUserDto,
    });
    return user;
  }

  async createContract(createContractDto: ContractDto) {
    const user = await this.prisma.contract.create({
      data: createContractDto,
    });
    return user;
  }
  findAll() {
    return this.prisma.user.findMany();
  }

  findOne(id: number) {
    return `This action returns a #${id} user`;
  }

  update(id: number, updateUserDto: UpdateUserDto) {
    return `This action updates a #${id} user`;
  }

  remove(id: number) {
    return `This action removes a #${id} user`;
  }

  async findAllClient() {
    const token = (await login()).data.data.token;
    const result = (
      await axios.get(
        'https://api2.eduzz.com/subscription/get_contract_list?page=2',
        {
          headers: {
            token: token,
          },
        },
      )
    ).data.data;
    result.forEach(async (element) => {
      const user = {
        id_eduzz: element.client_id.toString(),
        name: element.client_name,
        cpf: element.client_document,
        email: element.client_email,
      };
      await this.create(user).then((res) => {
        console.log('abbbb', res);
      });
    });
    return 'ok';
  }
}
