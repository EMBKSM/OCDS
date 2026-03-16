#include "cloud_mlp.hpp"
#include <iostream>

// 테스트벤치용 메인 함수
int main() {
    std::cout << "🚀 [TestBench] 시뮬레이션 시작..." << std::endl;

    // 1. 스트림 선언
    hls::stream<axis_t> in_stream("in_stream");
    hls::stream<axis_t> out_stream("out_stream");

    // 2. 가짜 데이터 입력 (테스트용)
    // R=100, G=100, B=100, NIR=50 (눈이 아님)
    axis_t input_pixel;
    input_pixel.data = 0;
    input_pixel.data.range(7, 0)   = 100; // R
    input_pixel.data.range(15, 8)  = 100; // G
    input_pixel.data.range(23, 16) = 100; // B
    input_pixel.data.range(31, 24) = 50;  // NIR
    
    input_pixel.keep = -1;
    input_pixel.last = 1; // 마지막 픽셀이라고 표시
    
    in_stream.write(input_pixel);

    // 3. Top Function 실행
    std::cout << "🔄 [TestBench] Top Function 호출 중..." << std::endl;
    cloud_mlp_top(in_stream, out_stream);

    // 4. 결과 확인
    if (!out_stream.empty()) {
        axis_t output_pixel = out_stream.read();
        std::cout << "✅ [Result] 출력 데이터: " << std::hex << output_pixel.data << std::dec << std::endl;
        
        if (output_pixel.data == 0) std::cout << "👉 결과: 구름 아님 (Background)" << std::endl;
        else std::cout << "👉 결과: 구름 (Cloud)" << std::endl;
    } else {
        std::cout << "❌ [Error] 출력 데이터가 없습니다!" << std::endl;
        return 1;
    }

    std::cout << "🎉 [TestBench] 테스트 성공!" << std::endl;
    return 0;
}