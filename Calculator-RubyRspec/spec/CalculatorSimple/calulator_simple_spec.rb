require 'models/calculator'
require 'models/courses'
require 'models/students'

$counter = 0

describe CalculatorSimple, "4 operações", type: :model do
    context "Soma" do
        it {is_expected.to be_instance_of(CalculatorSimple).and respond_to(:sum)}
        it {expect(subject.sum(10,9)).to eq(19).and be_an(Integer).and be_positive}
        it {expect(subject.sum(-10,9)).to eq(-1).and be_an(Integer).and be_negative}
        it {expect(subject.sum(-9,-10)).to eq(-19).and be_an(Integer).and be_negative}
        it {expect(subject.sum(0,0)).to eq(0).and be_an(Integer)}
        it {expect(subject.sum(1.5,1.6)).to eq(3.1).and be_an(Float)}

        it {expect(subject.sum("asas",0)).to eq("Operação Inválida. Only Numbers") }
        it {expect(subject.sum("asas","asdad")).to eq("Operação Inválida. Only Numbers") }
        it {expect(subject.sum(0,"asdasda")).to eq("Operação Inválida. Only Numbers") }
        it {expect(subject.sum(12,"asdasda")).to eq("Operação Inválida. Only Numbers") }
        it {expect(subject.sum("asdasda",12)).to eq("Operação Inválida. Only Numbers") }
        it {expect(subject.sum(nil,0)).to eq("Operação Inválida. Argumentos Nulo") }
        # it {expect(subject.sum()).to raise_error(ArgumentError) }
        # it {expect(subject.sum()).to raise_error(Exception,"Operação Inválida") }
        it {expect(sort).to eq("Uva").or eq("Laranja").or eq("Banana")}
    end

    
    
end

describe "teste" do
    context "Testes Let" do
        let(:count) { $counter += 1 }

        it 'Memoriza valor' do
        expect(count).to eq(1) # => count = 1     
        expect(count).to eq(1) # => count = 1 (em cache, chamado só na primeira vez)     
        end
        
        it 'Não cacheado' do
            expect(count).to eq(2) # => count = 2 
        end

    end
end

# Matchers de comparação
    # be : compara objetos
    # eq : compara valores
    # be > 0
    # be >= 0
    # be < 0
    # be_between(x,y).inclusive || .exclusive
    # match(/regex/) => Expressão regular
    # end_with(value)
    # start_with(value)

# Matchers True/False
    # be true / be_truthy
    # be false / be_falsey
    # be_nil

# Matchers Classe e Tipo
    # be_instance_of(class) => Sem herança
    # be_kind_of(class) => Com herança
    # respond_to(:method) => Verifica a resposta do método

# Matchers para Atributos de Classes
    # have_attributes(:name start_with() :idade (be > 20) ...

# Métodos Predicados
    # be_odd, be_even, be_empty, be_zero, be_nil

# Macthers de Erros
    # expect{subject...}.to raise_error(NameError,'mensagem do erro', regex ...)

# Macthers para Arrays
    # expect([x]).to include(x,x...) (Elemento pertence ?)
    # expect([x,y]).to contain_exactly(y,x) (Contém no array)
    # expect([x,y]).to match_array([x,y]) (Igual ao array)

# Matchers de Rangers
    # expect((x..y)).to cover(x)  (x apareça no range)

# One liner
    # expect(subject).to cover(x) == is_expected.to cover(x)
    # it { is_expected.to cover(x) } (Descrição e teste sem bloco de código)
    # it { is_expected.to eq().or eq().or eq() } 
    # it { is_expected.to eq().and eq().and eq() } 

# Macther para coleção
    # it { is_expected.to all( be_odd.and be_an(integer) ) } 
    # it { is_expected.to all start_with('ruby').and include('r') } 
# Macther be_within
    # it { expect(12.5).to be_within(0.5).of(12)} 
    # it { expect([11.6,12.1,12.5]).to all (be_within(0.5).of(12))} 
# Macther satisfy
    # it { expect(2).to satisfy(x % 2 = 0)} 
    # it { expect(2).to satisfy("par") do 
    #   x % 2 = 0
    # end 
# Helper Methods
# Hooks
    # config.before(:suite) do (Antes da suite de testes)
    # config.after(:suite) do 
    # config.before(:all) do (Antes de todos os testes)
    # config.before(:each) do (Antes de cada teste)
    # arround(:all) do |teste|  teste.run (antes e depois dos testes)
# Lets
   # let(:pessoa) { Pessoa.new }  // Invoca na primeira chamada
   # let!(:pessoa) { Pessoa.new }  // Invoca assim que o novo teste inicia

# Macther Change
    # expect(Calculator.incrementa).to change(Calculator.qtd)
    # expect(Calculator.incrementa).to change(Calculator.qtd).by(1)
    # expect(Calculator.incrementa).to change(Calculator.qtd).from(2).to(3)
# Output
    #  it {expect(puts "Vitor").to output("Vitor/n").to_stdout}
    #  it {expect(puts "Vitor").to output(/Vitor/).to_stdout}
    #  it {expect(warn "Erro").to output(/Erro/).to_stderr}
# Agregar Falhas :
    # Continua mesmo dando erro
    
    # aggregate_failures do
    #     #  it {expect(puts "Vitor").to output("Vitor/n").to_stdout}
    #     #  it {expect(puts "Vitor").to output(/Vitor/).to_stdout}
    #     #  it {expect(warn "Erro").to output(/Erro/).to_stderr}
    # end

# Shared Examples
    # Usado para testes repetitivos, com valores dinamicos

    # shared_examples 'status' do |sta|
    #     it "#{sta}" do
    #         pessoa.send("#{sta}!")
    #         expect(pessoa).to respond_to("#{sta}!")
    #         expect(pessoa.status).to eq("xxxx")
    #     end
    # end
    # ...
    # include_example('status' , :feliz) 
    # it_behaves_like('status' , :triste)
    # it_should_behave_like('status' , :contente)

# Customizando Macthers

RSpec::Matchers.define :be_a_multiple_of do |expected| #Parametro => expected
    match do |actual|
        actual % expected == 0
    end

    # Mensagem de erro
    failure_message do |actual|
        "Esperava que #{actual} fosse multiplo de #{expected}"
    end

    # Mensagem de match
    description do |actual|
        "#{actual} é um multiplo de #{expected}"
    end

end

describe 21, "Customizando Macther multiplo", type: 'sobrescrevendo'  do
    it {is_expected.to be_a_multiple_of(3)}
end


# Tags Filters :
    # describe CalculatorSimple, "4 operações", type: :model do
    # $ rspec -t type:model
    # describe CalculatorSimple, "4 operações", type: :testes_calculadora do
    # $ rspec -t type:testes_calculadora


describe "Test Double" do
    it 'testando' do
        user = double('User') # Objeto Falso
        allow(user).to receive_messages(name: "Vitor Novaes", password: "123456")
        puts user.name
        puts user.password
    end

end

# Stubs: Forçar uma resposta específica de um colaborador (Fase de Setup)
describe "Stub" do
    it '#Has_Finished?' do
       student = Students.new
       course = Courses.new
        
        allow(student).to receive(:has_finished?) #Retorno de um método Stub
            .with(an_instance_of(course)) #Argumento
            .and_return(true) #Retorno
        
        course_finished = student.has_finished?(course)
        expect(course_finished).to be_truthy
    end

    it '#foo' do
        student = double('Student') # Objeto Falso
        
        allow(student).to receive(:foo) do |arg|
            if arg == :hello
                "Olá"
            elsif arg ==:hi
                "Hi!!"
            end
        end
        
        expect(student.foo(:hello)).to eq("Olá")
        expect(student.foo(:hi)).to eq("Hi!!")
    end

    it 'Errors' do
        student = double('Student') # Objeto Falso
        
        allow(student).to receive(:bar).and_raise(RuntimeError)
        
        expect{student.bar}.to raise_error(RuntimeError)
    end

end

# Mocks :  Usados para testar comportamentos (Fase Verify)
describe "Mocks" do
    
    it '#bar' do
        # Setup
        student = double('Student') # Objeto Falso
        
        # Verify
        expect(student).to receive(:bar)

        # Exercise
        student.bar
    end

    it 'args' do
        student = double('Student') # Objeto Falso
        
        expect(student).to receive(:foo).with(123) # mock
        allow(student).to receive_messages(foo: "123") # stub

        # Exercise
        student.foo(123)
    end

    it 'Repetição' do
        student = double('Student') # Objeto Falso
        
        expect(student).to receive(:foo).with(123).twice # mock
        # expect(student).to receive(:foo).with(123).once
        # expect(student).to receive(:foo).with(123).exactly(3).times
        # expect(student).to receive(:foo).with(123).at_least(:once) ... twice ...
        # expect(student).to receive(:foo).with(123).at_least(n).times

        allow(student).to receive_messages(foo: "123") # stub

        # Exercise
        student.foo(123)
        student.foo(123)
    end


    it 'retorno' do
        student = double('Student') # Objeto Falso
        
        expect(student).to receive(:foo).with(123).and_return(false) # mock
        # allow(student).to receive_messages(foo: true) # stub

        # Exercise
        puts student.foo(123) # => false
        # Mock força o retorno do comportamento :foo para false
    end

    
end

# As_null_object
describe "As_null_object" do
    it 'test' do
        user = double('User').as_null_object # Objeto Falso
        allow(user).to receive(:name).and_return("Vitor Novaes")
        allow(user).to receive(:password).and_return("123456")
        
        expect(user).to respond_to(:name)
        expect(user).to respond_to(:password)
        user.name
    end

end