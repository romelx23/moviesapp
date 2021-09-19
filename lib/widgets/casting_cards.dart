import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {
  final int? moieId;
  const CastingCards({Key? key, this.moieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 30),
        width: double.infinity,
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) => _CastCard(),
        ));
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 150,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(
                    'https://scontent.flim17-1.fna.fbcdn.net/v/t1.6435-9/241500153_1819559658252542_3920755865636920042_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=730e14&_nc_ohc=baTGlbiJVUoAX9CistH&tn=g9v77dFRtTqSNpzR&_nc_ht=scontent.flim17-1.fna&oh=a3caad5e80346a5fdcb692903b360610&oe=615DA207'),
                height: 100,
                width: 100,
                fit: BoxFit.cover),
          ),
          SizedBox(height: 5),
          Text(
            'actor.name asfasf gat',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
