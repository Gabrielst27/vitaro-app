import 'package:vitaro_app/domain/enums/muscular_groups_enum.dart';
import 'package:vitaro_app/domain/models/exercise_model.dart';

final List<ExerciseModel> staticExercises = [
  ExerciseModel(
    id: '0001',
    name: 'Supino Reto (Barra)',
    muscularGroup: EMuscularGroups.chest,
  ),
  ExerciseModel(
    id: '0002',
    name: 'Supino Reto (Smith)',
    muscularGroup: EMuscularGroups.chest,
  ),
  ExerciseModel(
    id: '0003',
    name: 'Supino Reto (Halter)',
    muscularGroup: EMuscularGroups.chest,
  ),
  ExerciseModel(
    id: '0004',
    name: 'Crucifixo Reto (Halter)',
    muscularGroup: EMuscularGroups.chest,
  ),
  ExerciseModel(
    id: '0005',
    name: 'Crucifixo Reto (Crossover)',
    muscularGroup: EMuscularGroups.chest,
  ),
  ExerciseModel(
    id: '0006',
    name: 'Crucifixo Reto (Máquina)',
    muscularGroup: EMuscularGroups.chest,
  ),
  ExerciseModel(
    id: '0007',
    name: 'Agachamento (Barra)',
    muscularGroup: EMuscularGroups.quadriceps,
  ),
  ExerciseModel(
    id: '0008',
    name: 'Agachamento (Hack)',
    muscularGroup: EMuscularGroups.quadriceps,
  ),
  ExerciseModel(
    id: '0009',
    name: 'Agachamento (Smith)',
    muscularGroup: EMuscularGroups.quadriceps,
  ),
  ExerciseModel(
    id: '0010',
    name: 'Agachamento (Cadeira Smith)',
    muscularGroup: EMuscularGroups.quadriceps,
  ),
  ExerciseModel(
    id: '0011',
    name: 'Leg Press 45°',
    muscularGroup: EMuscularGroups.quadriceps,
  ),
  ExerciseModel(
    id: '0012',
    name: 'Cadeira Extensora',
    muscularGroup: EMuscularGroups.quadriceps,
  ),
  ExerciseModel(
    id: '0013',
    name: 'Puxada Frente Aberta (Pulley)',
    muscularGroup: EMuscularGroups.dorsi,
  ),
  ExerciseModel(
    id: '0014',
    name: 'Puxada Frente Fechada (Pulley)',
    muscularGroup: EMuscularGroups.dorsi,
  ),
  ExerciseModel(
    id: '0015',
    name: 'Puxada Frente Neutra (Pulley)',
    muscularGroup: EMuscularGroups.dorsi,
  ),
  ExerciseModel(
    id: '0016',
    name: 'Remada Cavalinho',
    muscularGroup: EMuscularGroups.dorsi,
  ),
  ExerciseModel(
    id: '0017',
    name: 'Remada Curvada',
    muscularGroup: EMuscularGroups.dorsi,
  ),
  ExerciseModel(
    id: '0018',
    name: 'Remada Baixa',
    muscularGroup: EMuscularGroups.dorsi,
  ),
  ExerciseModel(
    id: '0019',
    name: 'Puxada Frente Aberta (Máquina)',
    muscularGroup: EMuscularGroups.dorsi,
  ),
  ExerciseModel(
    id: '0020',
    name: 'Cadeira Abdutora',
    muscularGroup: EMuscularGroups.glute,
  ),
  ExerciseModel(
    id: '0021',
    name: 'Glúteo na Polia',
    muscularGroup: EMuscularGroups.glute,
  ),
  ExerciseModel(
    id: '0022',
    name: 'Glúteo no Smith',
    muscularGroup: EMuscularGroups.glute,
  ),
  ExerciseModel(
    id: '0023',
    name: 'Avanço com Halteres',
    muscularGroup: EMuscularGroups.glute,
  ),
  ExerciseModel(
    id: '0024',
    name: 'Avanço no Smith',
    muscularGroup: EMuscularGroups.glute,
  ),
  ExerciseModel(
    id: '0025',
    name: 'Passada no Smith',
    muscularGroup: EMuscularGroups.glute,
  ),
  ExerciseModel(
    id: '0026',
    name: 'Mesa Flexora',
    muscularGroup: EMuscularGroups.hamstrings,
  ),
  ExerciseModel(
    id: '0027',
    name: 'Cadeira Flexora',
    muscularGroup: EMuscularGroups.hamstrings,
  ),
  ExerciseModel(
    id: '0028',
    name: 'Stiff com Halteres',
    muscularGroup: EMuscularGroups.hamstrings,
  ),
  ExerciseModel(
    id: '0029',
    name: 'Stiff com Barra',
    muscularGroup: EMuscularGroups.hamstrings,
  ),
  ExerciseModel(
    id: '0030',
    name: 'Rosca Direta (Barra)',
    muscularGroup: EMuscularGroups.biceps,
  ),
  ExerciseModel(
    id: '0031',
    name: 'Rosca Direta (Halter)',
    muscularGroup: EMuscularGroups.biceps,
  ),
  ExerciseModel(
    id: '0032',
    name: 'Rosca Alternada',
    muscularGroup: EMuscularGroups.biceps,
  ),
  ExerciseModel(
    id: '0033',
    name: 'Rosca Concentrada',
    muscularGroup: EMuscularGroups.biceps,
  ),
  ExerciseModel(
    id: '0034',
    name: 'Rosca no Banco Scott',
    muscularGroup: EMuscularGroups.biceps,
  ),
  ExerciseModel(
    id: '0035',
    name: 'Tríceps Pulley',
    muscularGroup: EMuscularGroups.triceps,
  ),
  ExerciseModel(
    id: '0036',
    name: 'Tríceps Francês',
    muscularGroup: EMuscularGroups.triceps,
  ),
  ExerciseModel(
    id: '0037',
    name: 'Tríceps Testa (Barra)',
    muscularGroup: EMuscularGroups.triceps,
  ),
  ExerciseModel(
    id: '0038',
    name: 'Tríceps Testa (Halter)',
    muscularGroup: EMuscularGroups.triceps,
  ),
  ExerciseModel(
    id: '0039',
    name: 'Tríceps Corda',
    muscularGroup: EMuscularGroups.triceps,
  ),
  ExerciseModel(
    id: '0040',
    name: 'Desenvolvimento (Barra)',
    muscularGroup: EMuscularGroups.deltoid,
  ),
  ExerciseModel(
    id: '0041',
    name: 'Desenvolvimento (Halter)',
    muscularGroup: EMuscularGroups.deltoid,
  ),
  ExerciseModel(
    id: '0042',
    name: 'Desenvolvimento (Máquina)',
    muscularGroup: EMuscularGroups.deltoid,
  ),
  ExerciseModel(
    id: '0043',
    name: 'Elevação Lateral (Halter)',
    muscularGroup: EMuscularGroups.deltoid,
  ),
  ExerciseModel(
    id: '0044',
    name: 'Elevação Lateral (Cabo)',
    muscularGroup: EMuscularGroups.deltoid,
  ),
  ExerciseModel(
    id: '0045',
    name: 'Elevação Frontal (Halter)',
    muscularGroup: EMuscularGroups.deltoid,
  ),
  ExerciseModel(
    id: '0046',
    name: 'Elevação Frontal (Cabo)',
    muscularGroup: EMuscularGroups.deltoid,
  ),
  ExerciseModel(
    id: '0047',
    name: 'Elevação Posterior (Halter)',
    muscularGroup: EMuscularGroups.deltoid,
  ),
  ExerciseModel(
    id: '0048',
    name: 'Encolhimento de Ombros',
    muscularGroup: EMuscularGroups.trapezius,
  ),
  ExerciseModel(
    id: '0049',
    name: 'Panturrilha em Pé',
    muscularGroup: EMuscularGroups.calf,
  ),
  ExerciseModel(
    id: '0050',
    name: 'Panturrilha Sentado',
    muscularGroup: EMuscularGroups.calf,
  ),
  ExerciseModel(
    id: '0051',
    name: 'Panturrilha no Leg Press',
    muscularGroup: EMuscularGroups.calf,
  ),
  ExerciseModel(
    id: '0052',
    name: 'Abdominal Supra',
    muscularGroup: EMuscularGroups.abdomen,
  ),
  ExerciseModel(
    id: '0053',
    name: 'Abdominal Infra',
    muscularGroup: EMuscularGroups.abdomen,
  ),
  ExerciseModel(
    id: '0054',
    name: 'Prancha',
    muscularGroup: EMuscularGroups.abdomen,
  ),
];
