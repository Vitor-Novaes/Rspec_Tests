require 'models/calculator'

describe CalculatorSimple, "4 operações",type: :model do
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

    
