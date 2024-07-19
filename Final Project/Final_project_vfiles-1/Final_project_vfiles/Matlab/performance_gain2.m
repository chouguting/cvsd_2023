clear
close all
clc

% Change the packet number (1-6)
% 11-20: SNR10
% 21-30: SNR15
packet_no = 40;

switch packet_no
    case 1
        file_R = importdata('.\Result\out_R_SNR10_P1_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR10_P1_result.txt');
        llr_gld = importdata('.\llr_gld\packet_1\llr_gld.mat');
    case 2
        file_R = importdata('.\Result\out_R_SNR10_P2_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR10_P2_result.txt');
        llr_gld = importdata('.\llr_gld\packet_2\llr_gld.mat');
    case 3
        file_R = importdata('.\Result\out_R_SNR10_P3_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR10_P3_result.txt');
        llr_gld = importdata('.\llr_gld\packet_3\llr_gld.mat');
    case 4
        file_R = importdata('.\Result\out_R_SNR15_P4_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR15_P4_result.txt');
        llr_gld = importdata('.\llr_gld\packet_4\llr_gld.mat');
    case 5
        file_R = importdata('.\Result\out_R_SNR15_P5_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR15_P5_result.txt');
        llr_gld = importdata('.\llr_gld\packet_5\llr_gld.mat');
    case 6
        file_R = importdata('.\Result\out_R_SNR15_P6_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR15_P6_result.txt');
        llr_gld = importdata('.\llr_gld\packet_6\llr_gld.mat');
    case 11
        file_R = importdata('.\Result\out_R_SNR10_P11_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR10_P11_result.txt');
        llr_gld = importdata('.\llr_gld\packet_11\llr_gld.mat');
    case 12
        file_R = importdata('.\Result\out_R_SNR10_P12_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR10_P12_result.txt');
        llr_gld = importdata('.\llr_gld\packet_12\llr_gld.mat');
    case 13
        file_R = importdata('.\Result\out_R_SNR10_P13_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR10_P13_result.txt');
        llr_gld = importdata('.\llr_gld\packet_13\llr_gld.mat');
    case 14
        file_R = importdata('.\Result\out_R_SNR10_P14_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR10_P14_result.txt');
        llr_gld = importdata('.\llr_gld\packet_14\llr_gld.mat');
    case 15
        file_R = importdata('.\Result\out_R_SNR10_P15_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR10_P15_result.txt');
        llr_gld = importdata('.\llr_gld\packet_15\llr_gld.mat');
    case 16
        file_R = importdata('.\Result\out_R_SNR10_P16_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR10_P16_result.txt');
        llr_gld = importdata('.\llr_gld\packet_16\llr_gld.mat');
    case 17
        file_R = importdata('.\Result\out_R_SNR10_P17_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR10_P17_result.txt');
        llr_gld = importdata('.\llr_gld\packet_17\llr_gld.mat');
    case 18
        file_R = importdata('.\Result\out_R_SNR10_P18_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR10_P18_result.txt');
        llr_gld = importdata('.\llr_gld\packet_18\llr_gld.mat');
    case 19
        file_R = importdata('.\Result\out_R_SNR10_P19_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR10_P19_result.txt');
        llr_gld = importdata('.\llr_gld\packet_19\llr_gld.mat');
    case 20
        file_R = importdata('.\Result\out_R_SNR10_P20_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR10_P20_result.txt');
        llr_gld = importdata('.\llr_gld\packet_20\llr_gld.mat');
    case 21
        file_R = importdata('.\Result\out_R_SNR15_P21_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR15_P21_result.txt');
        llr_gld = importdata('.\llr_gld\packet_21\llr_gld.mat');
    case 22
        file_R = importdata('.\Result\out_R_SNR15_P22_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR15_P22_result.txt');
        llr_gld = importdata('.\llr_gld\packet_22\llr_gld.mat');
    case 23
        file_R = importdata('.\Result\out_R_SNR15_P23_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR15_P23_result.txt');
        llr_gld = importdata('.\llr_gld\packet_23\llr_gld.mat');
    case 24
        file_R = importdata('.\Result\out_R_SNR15_P24_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR15_P24_result.txt');
        llr_gld = importdata('.\llr_gld\packet_24\llr_gld.mat');
    case 25
        file_R = importdata('.\Result\out_R_SNR15_P25_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR15_P25_result.txt');
        llr_gld = importdata('.\llr_gld\packet_25\llr_gld.mat');
    case 26
        file_R = importdata('.\Result\out_R_SNR15_P26_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR15_P26_result.txt');
        llr_gld = importdata('.\llr_gld\packet_26\llr_gld.mat');
    case 27
        file_R = importdata('.\Result\out_R_SNR15_P27_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR15_P27_result.txt');
        llr_gld = importdata('.\llr_gld\packet_27\llr_gld.mat');
    case 28
        file_R = importdata('.\Result\out_R_SNR15_P28_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR15_P28_result.txt');
        llr_gld = importdata('.\llr_gld\packet_28\llr_gld.mat');
    case 29
        file_R = importdata('.\Result\out_R_SNR15_P29_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR15_P29_result.txt');
        llr_gld = importdata('.\llr_gld\packet_29\llr_gld.mat');
    case 30
        file_R = importdata('.\Result\out_R_SNR10_P30_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR10_P30_result.txt');
        llr_gld = importdata('.\llr_gld\packet_30\llr_gld.mat');
    case 31
        file_R = importdata('.\Result\out_R_SNR10_P31_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR10_P31_result.txt');
        llr_gld = importdata('.\llr_gld\packet_31\llr_gld.mat');
    case 32
        file_R = importdata('.\Result\out_R_SNR10_P32_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR10_P32_result.txt');
        llr_gld = importdata('.\llr_gld\packet_32\llr_gld.mat');
    case 33
        file_R = importdata('.\Result\out_R_SNR10_P33_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR10_P33_result.txt');
        llr_gld = importdata('.\llr_gld\packet_33\llr_gld.mat');
case 34
        file_R = importdata('.\Result\out_R_SNR10_P34_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR10_P34_result.txt');
        llr_gld = importdata('.\llr_gld\packet_34\llr_gld.mat');
    case 35
        file_R = importdata('.\Result\out_R_SNR10_P35_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR10_P35_result.txt');
        llr_gld = importdata('.\llr_gld\packet_35\llr_gld.mat');
    case 36
        file_R = importdata('.\Result\out_R_SNR10_P36_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR10_P36_result.txt');
        llr_gld = importdata('.\llr_gld\packet_36\llr_gld.mat');
    case 37
        file_R = importdata('.\Result\out_R_SNR10_P37_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR10_P37_result.txt');
        llr_gld = importdata('.\llr_gld\packet_37\llr_gld.mat');
    case 38
        file_R = importdata('.\Result\out_R_SNR10_P38_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR10_P38_result.txt');
        llr_gld = importdata('.\llr_gld\packet_38\llr_gld.mat');
    case 39
        file_R = importdata('.\Result\out_R_SNR10_P39_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR10_P39_result.txt');
        llr_gld = importdata('.\llr_gld\packet_39\llr_gld.mat');
    case 40
        file_R = importdata('.\Result\out_R_SNR10_P40_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR10_P40_result.txt');
        llr_gld = importdata('.\llr_gld\packet_40\llr_gld.mat');
    case 41
        file_R = importdata('.\Result\out_R_SNR15_P41_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR15_P41_result.txt');
        llr_gld = importdata('.\llr_gld\packet_41\llr_gld.mat');
    case 42
        file_R = importdata('.\Result\out_R_SNR15_P42_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR15_P42_result.txt');
        llr_gld = importdata('.\llr_gld\packet_42\llr_gld.mat');
    case 43
        file_R = importdata('.\Result\out_R_SNR15_P43_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR15_P43_result.txt');
        llr_gld = importdata('.\llr_gld\packet_43\llr_gld.mat');
    case 44
        file_R = importdata('.\Result\out_R_SNR10_P44_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR10_P44_result.txt');
        llr_gld = importdata('.\llr_gld\packet_44\llr_gld.mat');
    case 45
        file_R = importdata('.\Result\out_R_SNR10_P45_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR10_P45_result.txt');
        llr_gld = importdata('.\llr_gld\packet_45\llr_gld.mat');
    case 46
        file_R = importdata('.\Result\out_R_SNR10_P46_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR10_P46_result.txt');
        llr_gld = importdata('.\llr_gld\packet_46\llr_gld.mat');
    case 47
        file_R = importdata('.\Result\out_R_SNR10_P47_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR10_P47_result.txt');
        llr_gld = importdata('.\llr_gld\packet_47\llr_gld.mat');
    case 48
        file_R = importdata('.\Result\out_R_SNR10_P48_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR10_P48_result.txt');
        llr_gld = importdata('.\llr_gld\packet_48\llr_gld.mat');
    case 49
        file_R = importdata('.\Result\out_R_SNR10_P49_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR10_P49_result.txt');
        llr_gld = importdata('.\llr_gld\packet_49\llr_gld.mat');
    case 50
        file_R = importdata('.\Result\out_R_SNR10_P50_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR10_P50_result.txt');
        llr_gld = importdata('.\llr_gld\packet_50\llr_gld.mat');
    otherwise
        file_R = importdata('.\Result\out_R_SNR10_P1_result.txt');
        file_y_hat = importdata('.\Result\out_y_hat_SNR10_P1_result.txt');
        llr_gld = importdata('.\llr_gld\packet_1\llr_gld.mat');
end

no_RE_per_packet = 1000;
error_packet = 0;

llr_dut_buffer = [];

for index_RE = 1:size(file_R,1)

    error_RE = 0;

    % ========== R ========== %
    R_s = string(file_R(index_RE,:));

    dataDec = sscanf(R_s, '%5x');
    index = dataDec >= 2^19;
    dataDec(index) = dataDec(index) - 2^20;

    R44_real = dataDec(1)/2^16;
    R34_imag = dataDec(2)/2^16;
    R34_real = dataDec(3)/2^16;
    R24_imag = dataDec(4)/2^16;
    R24_real = dataDec(5)/2^16;
    R14_imag = dataDec(6)/2^16;
    R14_real = dataDec(7)/2^16;
    R33_real = dataDec(8)/2^16;
    R23_imag = dataDec(9)/2^16;
    R23_real = dataDec(10)/2^16;
    R13_imag = dataDec(11)/2^16;
    R13_real = dataDec(12)/2^16;
    R22_real = dataDec(13)/2^16;
    R12_imag = dataDec(14)/2^16;
    R12_real = dataDec(15)/2^16;
    R11_real = dataDec(16)/2^16;

    R11 = R11_real;
    R12 = R12_real+j*R12_imag;
    R13 = R13_real+j*R13_imag;
    R14 = R14_real+j*R14_imag;
    R22 = R22_real;
    R23 = R23_real+j*R23_imag;
    R24 = R24_real+j*R24_imag;
    R33 = R33_real;
    R34 = R34_real+j*R34_imag;
    R44 = R44_real;

    R = [R11 R12 R13 R14;
           0 R22 R23 R24;
           0   0 R33 R34;
           0   0   0 R44;];
    % ======================= %

    % ========== y_hat ========== %
    y_hat_s = string(file_y_hat(index_RE,:));

    dataDec = sscanf(y_hat_s, '%5x');
    index = dataDec >= 2^19;
    dataDec(index) = dataDec(index) - 2^20;

    y_hat_4_imag = dataDec(1)/2^16;
    y_hat_4_real = dataDec(2)/2^16;
    y_hat_3_imag = dataDec(3)/2^16;
    y_hat_3_real = dataDec(4)/2^16;
    y_hat_2_imag = dataDec(5)/2^16;
    y_hat_2_real = dataDec(6)/2^16;
    y_hat_1_imag = dataDec(7)/2^16;
    y_hat_1_real = dataDec(8)/2^16;
    % =========================== %

    Qy1 = y_hat_1_real+j*y_hat_1_imag;
    Qy2 = y_hat_2_real+j*y_hat_2_imag;
    Qy3 = y_hat_3_real+j*y_hat_3_imag;
    Qy4 = y_hat_4_real+j*y_hat_4_imag;

    Qy = [Qy1;
          Qy2;
          Qy3;
          Qy4;];

    [llr_dut, ~] = nrMLD(Qy, R, 'no_use', 0, 'soft');
    llr_dut_buffer = [llr_dut_buffer; llr_dut'];

    for i = 1:8

        if ( sign(llr_dut(i)) == sign(llr_gld(index_RE,i)) )

            if (abs(llr_dut(i)) >= abs(llr_gld(index_RE,i)))

                error_RE = error_RE;

            else

                error_RE = error_RE + (abs(llr_gld(index_RE,i))-abs(llr_dut(i)))/abs(llr_gld(index_RE,i));

            end

        else

            error_RE = error_RE + abs(llr_dut(i)-llr_gld(index_RE,i))/abs(llr_gld(index_RE,i));

        end

    end

    error_RE = error_RE/8;
    error_packet = error_packet + error_RE;

end

error_packet = error_packet/no_RE_per_packet;
disp(['The soft error rate is ', num2str(error_packet*100),'%'])
