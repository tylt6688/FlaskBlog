from aip import AipFace
from aip import AipBodyAnalysis

class tylt_AipFace:

    face_constrast_img1 = None
    face_constrast_img2 = None

    def __init__(self):
        self.APP_ID = '14370315'
        self.API_KEY = 'RCFIR305Gi3doMQykqVqS3OP'
        self.SERECT_KEY = 'bj3hLsPX6mXc0jjiBQnGAoMIKsMInnTG'
        self.client = AipFace(self.APP_ID, self.API_KEY, self.SERECT_KEY)

    def face_detect(self, image):
        """
        调用人脸检测
        :param image:人脸检测图片base64编码
        :return: 人脸检测结果
        """
        imageType = "BASE64"
        options = {
            'max_face_num': 10,
            'face_field': 'age,beauty,expression,faceshape,gender,glasses,race,quality,facetype'
        }
        return self.client.detect(image, imageType, options)

    def set_face_constrast_img1(self, image):
        self.face_constrast_img1 = image

    def set_face_constrast_img2(self, image):
        self.face_constrast_img2 = image

    def face_contrast(self):
        """
        调用人脸对比
        :return: 人脸对比结果
        """
        result = self.client.match([
            {
                'image': self.face_constrast_img1,
                'image_type': 'BASE64',
            },
            {
                'image': self.face_constrast_img2,
                'image_type': 'BASE64',
            }
        ])
        return result



    @staticmethod
    def dealwith_face_detect_result(face_list):
        """
        处理人脸信息并返回
        :param face_list:人脸信息列表
        :return: reponse_face_list：经过处理后的人脸信息列表
        """
        reponse_face_list = []
        for i in range(len(face_list)):
            face = face_list[i]
            expression = '没有笑容'
            if face['expression']['type'] == 'none':
                expression = '没有笑容'
            elif face['expression']['type'] == 'smile':
                expression = '面带微笑'
            elif face['expression']['type'] == 'laugh':
                expression = '笑逐颜开'
            face_shape = '圆形脸'
            if face['face_shape']['type'] == 'square':
                face_shape = '国字脸'
            elif face['face_shape']['type'] == 'triangle':
                face_shape = '三角形脸'
            elif face['face_shape']['type'] == 'oval':
                face_shape = '椭圆形脸'
            elif face['face_shape']['type'] == 'heart':
                face_shape = '瓜子脸'
            elif face['face_shape']['type'] == 'round':
                face_shape = '圆形脸'
            gender = '男'
            if face['gender']['type'] == 'male':
                gender = '男'
            elif face['gender']['type'] == 'female':
                gender = '女'
            glasses = '没戴眼镜'
            if face['glasses']['type'] == 'none':
                glasses = '没戴眼镜'
            elif face['glasses']['type'] == 'common':
                glasses = '戴普通眼镜'
            elif face['glasses']['type'] == 'sun':
                glasses = '戴墨镜'
            race = '黄种人'
            if face['race']['type'] == 'yellow':
                race = '黄种人'
            elif face['race']['type'] == 'white':
                race = '白种人'
            elif face['race']['type'] == 'black':
                race = '黑种人'
            elif face['race']['type'] == 'arabs':
                race = '阿拉伯人'
            face_type = '真实人脸'
            if face['face_type']['type'] == 'human':
                face_type = '真实人脸'
            elif face['face_type']['type'] == 'cartoon':
                face_type = '卡通人脸'
            face_info_dict = {
                'no': '第%d张人脸：' % (i + 1),
                'x': round(face['location']['left'], 3),
                'y': round(face['location']['top'], 3),
                'width': face['location']['width'],
                'height': face['location']['height'],
                'rotation': face['location']['rotation'],
                'gender': gender,
                'age': face['age'],
                'beauty': round(face['beauty']),
                'expression': expression,
                'face_shape': face_shape,
                'glasses': glasses,
                'race': race,
                'face_type': face_type,
            }
            reponse_face_list.append(face_info_dict)
        return reponse_face_list


class tylt_AipBodyAnalysis:
    def __init__(self):
        self.APP_ID = '14372361'
        self.API_KEY = 'rwIh36pOcyqV8S9rQ6BBQlxh'
        self.SERECT_KEY = 'NiHoVNuAwK1RoBRypCKo6OPQrdopWU2Y'
        self.client = AipBodyAnalysis(self.APP_ID, self.API_KEY, self.SERECT_KEY)

    def body_attr(self,image):
        return self.client.bodyAttr(image)

    @staticmethod
    def dealwith_body_attr_result(person_info_list):
        """
        处理人体属性信息并返回
        :param person_info_list: 人体属性信息列表
        :return:
        """
        response_list=[]
        for person in person_info_list:
            attributes=person['attributes']
            location={
                'left':person['location']['left'],
                'top': person['location']['top'],
                'width': person['location']['width'],
                'height': person['location']['height'],
            }
            person_info_dict={
                'upper_wear_fg':attributes['upper_wear_fg']['name'],
                'cellphone':attributes['cellphone']['name'],
                'lower_cut': attributes['lower_cut']['name'],
                'umbrella': attributes['umbrella']['name'],
                'orientation': attributes['orientation']['name'],
                'headwear': attributes['headwear']['name'],
                'gender': attributes['gender']['name'],
                'age': attributes['age']['name'],
                'upper_cut': attributes['upper_cut']['name'],
                'glasses': attributes['glasses']['name'],
                'lower_color': attributes['lower_color']['name'],
                'bag': attributes['bag']['name'],
                'upper_wear_texture': attributes['upper_wear_texture']['name'],
                'smoke': attributes['smoke']['name'],
                'vehicle': attributes['vehicle']['name'],
                'lower_wear': attributes['lower_wear']['name'],
                'carrying_item': attributes['carrying_item']['name'],
                'upper_wear': attributes['upper_wear']['name'],
                'upper_color': attributes['upper_color']['name'],
                'occlusion':attributes['occlusion']['name'],
                'location': location,
            }
            response_list.append(person_info_dict)

        return response_list
