import 'package:newapp/model/category_model.dart';

List<CategoryModel> getcategory(){
  List<CategoryModel> category=[];

  CategoryModel categoryModel=CategoryModel();

  categoryModel=CategoryModel();
  categoryModel.categoryName="Business";
  categoryModel.imageUrl='https://online.hbs.edu/Style%20Library/api/resize.aspx?imgpath=/PublishingImages/overhead-view-of-business-strategy-meeting.jpg&w=1200&h=630';
  category.add(categoryModel);


  categoryModel=CategoryModel();
  categoryModel.categoryName="Entertainment";
  categoryModel.imageUrl='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFZmUVRjY2sx_W83f0suDTR4Vn-f2tVrvM9A&s';
  category.add(categoryModel);

  categoryModel=CategoryModel();
  categoryModel.categoryName="General";
  categoryModel.imageUrl='https://online.hbs.edu/Style%20Library/api/resize.aspx?imgpath=/PublishingImages/overhead-view-of-business-strategy-meeting.jpg&w=1200&h=630';
  category.add(categoryModel);

  categoryModel=CategoryModel();
  categoryModel.categoryName="Health";
  categoryModel.imageUrl='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZMMm8uXM93uP67ipLQtRlk6IFki6ZRPAMYQ&s';
  category.add(categoryModel);

categoryModel=CategoryModel();
  categoryModel.categoryName="Sports";
  categoryModel.imageUrl='https://theabingtonian.com/wp-content/uploads/2022/10/sport.jpg';
  category.add(categoryModel);

  categoryModel=CategoryModel();
  categoryModel.categoryName="Science";
  categoryModel.imageUrl='https://crc.losrios.edu/shared/img/program-940-529/general-science.jpg';
  category.add(categoryModel);

  categoryModel=CategoryModel();
  categoryModel.categoryName="Technology";
  categoryModel.imageUrl='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQybU2QmNu9mo8nVzxS3KKJ4-9S6H4bPg6zCw&s';
  category.add(categoryModel);


return category;
}