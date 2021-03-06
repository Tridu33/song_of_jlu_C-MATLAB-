
%% 吉林大学校歌
clear;
clc;
%语音部分通过unicode2native('字符串')转换unicode。
sp=actxserver('SAPI.SpVoice');%说话
sp.Speak(native2unicode([206   210   202   199   187   225   179   170 ...
    188   170   193   214   180   243   209   167   208   163   184  ...
    232   181   196   194   241   204   173   202   181   209   233  ...
    202   210]));%我是会唱吉林大学校歌的matlab
load handel;%Hallelu Ya哈利路亚
sound(y,Fs)%声音
pause(9);
AIzhizhang=native2unicode([182   212   178   187   198   240   163   172 184 ...
    227   180   237   193   203   163   172 200   203   185   164   214   199 ...  
    213   207   213   253   212   218   214   216   208   194 188   211   212   216    33]);
disp(AIzhizhang);
sp=actxserver('SAPI.SpVoice');%说话 
sp.Speak(native2unicode([182   212   178   187   198   240   163   172 184 ...
    227   180   237   193   203   163   172 200   203   185   164   214   199 ...  
    213   207   213   253   212   218   214   216   208   194 188   211   212   216    33]));
%对不起，搞错了，人工智障正在重新加载!
disp("loading...");%显示loading。。。
pause(4);
sound(sin(2*pi*25*(1:4000)/100));%哔
%schoolsong=imread('schoolsong.jpg');
%figure
%imshow(schoolsong); %显示乐谱的图片
%音乐播放部分,本小节音符预定义方式改编自http://lvcha6255.blog.sohu.com/309110348.html
% 本小节之所以没有用下面这样的代码手撕音乐预定义每一个音符，而借用网络资源，
%do0f = mod4.*cos(2*pi*ScaleTable(21)*f0*t4);
% re0f = mod4.*cos(2*pi*ScaleTable(22)*f0*t4);
% mi0f = mod4.*cos(2*pi*ScaleTable(23)*f0*t4);
%是因为这样写更加便于读者理解，修改音乐节拍从而换成自己的音乐也更加方便，
%故借用了网络的这些音符自定义
%当然，也可以通过下列注释部分类似的方法手撕类似的音符预定义
%但是懒得重复造轮子了，而且我也不能写的比他巧妙


fs=48000; %音乐扫描频率
dt=1/fs; %播放速度
f0=320;%音乐调高
T16=0.08;%十六分音符时长
t16=0:dt:T16;
m=size(t16,2);
t1=linspace(0,16*T16,16*m);% 全音符时长
t4_3=linspace(0,12*T16,12*m);% 附点二分音符时长
t2=linspace(0,8*T16,8*m);% 二分音符时长
t8_3=linspace(0,6*T16,6*m);% 附点四分音符时长
t4=linspace(0,4*T16,4*m);% 四分音符时长
t16_3=linspace(0,3*T16,3*m);% 附点八分音符时长
t8=linspace(0,2*T16,2*m);% 八分音符时长
% 定义音阶强度

index={'1';'4_3';'2';'8_3';'4';'16_3';'8';'16'};% 音符   全音符 附点二分音符 二分音符 附点四分音符 四分音符 附点八分音符 八分音符 十六分音符
for n=1:8
    str=['mod',char(index(n)),' = sin(pi*t',char(index(n)),...
        '/t',char(index(n)),'(end));'];
    eval(str);
end
ScaleTable = [1/2 9/16 5/8 2/3 3/4 5/6 15/16 ...
    1 9/8 5/4 4/3 3/2 5/3 9/5 15/8 ...
    2 9/4 5/2 8/3 3 10/3 15/4 4];
txt={'do','re','mi','fa','so','la','xi'};% 音符数组do re mi fa so la xi
nstr={'0','1','2'};% 强度字符串，0为低音，1为正常音，2为高音
mstr={'o','T','t','F','f','E','e','s'}; % 音符字符串o T t F f E e s
for nn=1:8
    for jj=1:3
        for ii=1:7
            mm=7*(jj - 1) + ii;
            str=[char(txt(ii)),char(nstr(jj)),char(mstr(nn)),...
                ' = mod',char(index(nn)),...
                '.*cos(2*pi*ScaleTable(',num2str(mm),')*f0*t',...
                char(index(nn)),');'];
            eval(str);
        end
    end
end                          % 各分音符的数组

o = zeros(1,size(t1,2));% 字符o(one)，全音符
T = zeros(1,size(t4_3,2));% 字符T(Two)，附点二分音符
t = zeros(1,size(t2,2));% 字符t(two)，二分音符
F = zeros(1,size(t8_3,2));% 字符F(Four)，附点四分音符
f = zeros(1,size(t4,2));% 字符f(four)，四分音符
E = zeros(1,size(t16_3,2));% 字符E(Eight)，附点八分音符
e = zeros(1,size(t8,2));% 字符e(eight)，八分音符
s = zeros(1,size(t16,2));% 字符s(sixteen)，十六分音符
% 音符名称对应英文首字母，大写表示加附点



% 吉林大学乐谱部分
yuepu = [mi2f do2E re2s...
mi2e mi2E...
fa2f re2E mi2s...
fa2e fa2F...
so2f mi2E fa2s...
so2e so2f fa2e...
mi2t...
re2f so2f...
do2t...
so1t...
mi1f fa1f...
so1t...
fa1f re1e mi1e...
fa1f la1f...
so1t...
so1t...
do2F re2e...
mi2f do2e do2e...
so1f so1E fa1s...
mi1f so1f...
re1f re1e mi1e...
fa1f la1f...
la1t...
la1t...
so1f do2E re2s...
mi2t...
mi2f re2e do2e...
la1F la1e...
la1f fa2f...
fa2f mi2e re2e...
mi2t...
mi2t...
la1f la1f...
re2f re2E re2s...
mi2f fa2f...
so2f do2e do2e...
 re2f do2E do2s...
xi1f la1f...
so1t...
so1t...
so2f mi2E fa2s...
so2e so2F ...
fa2f re2E mi2s...
fa2e fa2f...
mi2f do2E re2s...
mi2e mi2e mi2e la1e...
la1f xi1e do2e...
mi2f re2E re2s...
re2e mi2e re2f...
re2t...
so2f mi2E fa2s...
so2e so2F...
fa2f re2E mi2s...
fa2e fa2f...
mi2f do2E re2s...
mi2e mi2e mi2e la1e...
la1f xi1e do2e...
mi2f re2E re2s...
re2e re2e so2f...
so2t...
so2e fa2e mi2f...
mi2f so2f...
re2f mi2F ...
mi2t...
do2t ...
do2t];
% 音乐乐谱（yuepu数组内变量的命名规则：“音阶+强度+音符”形式）
%若有休止符号，直接写音符
%调用函数播放音乐
yuepu = yuepu/max(yuepu);
sound(yuepu,fs);
% 读写音频
audiowrite('song_of_jlu.wav',yuepu,fs);%写音乐
[y,Fs] = audioread('song_of_jlu.wav');%读音乐
t=length(y);
t=linspace(0, 1.8097,t); 

pause(10);
%figure
%plot(t,y);
pause(30);
close all;
clear all;
