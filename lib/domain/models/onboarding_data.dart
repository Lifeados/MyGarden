class OnboardingData {
  final String image;
  final String titleBlack;
  final String titleGreen;
  final String description;

  const OnboardingData({
    required this.image,
    required this.titleBlack,
    required this.titleGreen,
    required this.description,
  });
}

class OnboardingDataProvider {
  static List<OnboardingData> get onboardingDataList {
    return const [
      OnboardingData(
        image: 'lib/ui/assets/images/tomatoPlantation.jpeg',
        titleBlack: 'Cultive o ',
        titleGreen: 'melhor!',
        description:
            'Sementes de alta performance para começar a sua plantação com qualidade e produtividade garantidas.',
      ),
      OnboardingData(
        image: 'lib/ui/assets/images/allVegetables.jpeg',
        titleBlack: 'Explore nossa ',
        titleGreen: 'linha de sementes',
        description:
            'Encontre sementes que atendem todas as necessidades do seu cultivo, tudo com a excelência Feltrin.',
      ),
      OnboardingData(
        image: 'lib/ui/assets/images/scannerPlant.jpeg',
        titleBlack: 'Cuide das suas plantas com ',
        titleGreen: 'tecnologia.',
        description:
            'Analise a saúde das suas plantas e receba recomendações personalizadas para um cuidado ideal.',
      ),
    ];
  }
}
