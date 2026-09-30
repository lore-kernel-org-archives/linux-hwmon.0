Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76B93BE659
	for <linux-hwmon@vger.kernel.org>; Wed, 30 Sep 2026 10:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762545; cv=none; b=J+Daw9S7EEqIaHSF4b3H+zXHO8GSQa1Mg1J5dR1j9ATGRnibtH7frNmbDCUefCpsWKmWJEuj/fNbIwErX27kVkcMaYANdkx3qkonor0l0hzO3BxZpopjddbgp0lXYeljBCGMphSNLx9B//IhEQwF+mxUtDs2RxxkKN9+T7V/Nls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762545; c=relaxed/simple;
	bh=eJocVqgZC1LZ73uhvhGrTfsM5JBh1CAAbm6cuy+2k/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rgoAFBzXd+7YpaF08WKlAYEM/3rWU/MFECOGkdPNwm7LjPbcr4uq2FqUcZJntljI6ukwWQVl8w4a0CEr6oPtHuwIfwyj9ALS6vsoGRmOFD+MUrHYNDjaj7vH5xBrzpAkRc9f7jGrOFE7gdIoVFXJ4d5f/oZ0n2AliR9BE0VP+jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kK6mDofg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y4xjERmC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kK6mDofg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y4xjERmC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7daQB4047481
	for <linux-hwmon@vger.kernel.org>; Wed, 30 Sep 2026 10:02:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MPe77bI+fMFp1YsFWGh66THD7WQb0kpPqkpc9dkIEeY=; b=kK6mDofg1UYweraG
	FTYCsXqg8/0YygMTj5WZt9+hbTg+7Qdmeq4YjzSfCCgwUrtRb+nOegy0a9kAPzhl
	gdbIwnmL6JwOt8cAl1e0TA053uR8sK5zU4fmA8ejq2KuIUd2oHksgLk1cQWHU07T
	g7bkBkZcD7zH9/CLMm1A+UqJ+y8XJsH18kU94M+YUFp4BX80Tx0PIcT6wfAzz3jS
	1uidX+mWoPWTWpwIbxO4IuUpFIQv3Czert8/hGV/WVzYXwyr+144TK75VEgYwgR6
	O+LRnzHd6fdo7L0AVbK4LCJCgdjKDwGhcq9z2faaf6XdCCukOp5j3XcqQUhchvRQ
	d0sVew==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0mfab1n6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 30 Sep 2026 10:02:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso3751851a91.1
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Sep 2026 03:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790762542; x=1791367342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MPe77bI+fMFp1YsFWGh66THD7WQb0kpPqkpc9dkIEeY=;
        b=Y4xjERmCMcXF5VYmhsSbQlMXZBxOAMAGZdZanK81pdjND7DXV75/j+rcEeeSV4ftRY
         mObydIDapSlqq1BlUBuyArJfwaYzzl0vxnGXFV58Z2HJim71oJnVWz1VDYvdFoRZU67c
         F826BQffbvehbOlhzY6dZDfPb8kJKa+X0v+oSvJhW+i++ynxbQQ9F05tTPi8lV3GJum3
         zfPYtMWvT1HVTJPr8yEcecnIIvsviS6aevA1f+82x8IZR8NvP4ZarE/mkOZIRWhzsXtm
         hFtln/u1Moxbv9xFEm2SpDmDo3zYnkISGY7uJo2GZrF2U3NPBKxO27qcMteQCcwy6msT
         UznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790762542; x=1791367342;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MPe77bI+fMFp1YsFWGh66THD7WQb0kpPqkpc9dkIEeY=;
        b=0hWWw+wLFqXxI9WJF+K3F/ITrQD73iBS54QQJX7ROZgbYEIvffcz21sx5PTUCMc9Dh
         ayex7vDsSc7f/mUnpMdiHQKmHajKl/zz8X8ChEZv57w1d4DR7ohAiZQmQimh4dRX99D0
         wI8chUaj5xiougt6aK3wpRx5n6pm4cZ5Efdfw7NVX3NsE/CD5XBufZepQ3W4+RThNZJB
         y5dPBa08BGC7OWZ4C72cbPXmaI6q7tYt17YVlcBmtYuPmiZrUv+QaGVfDWxhWZNLm+DR
         ov/MiTRF0O8/AwutGmwGyKezv+lY4lfrQ75nprHgvXkSWS0u15aFuTEvSU+3O+wN/G/+
         8EoQ==
X-Forwarded-Encrypted: i=1; AKwUvByHuPNv2M5fBfFZvCEB+yxWWm9TKCvHrKMDuDlVElQegDBUJkBinRSTJsvqshYks2ihk1Z8aIVM20Y0sQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKyzIizLiUIFcTLb58uLapHtU9pLAhVyQvDp+RW0p6PRm+coPyo
	HXKLfL6vxfjt2akwZwqbkun02JXu8XALYFqNvI/x2YtKpN2KwMFIiI1UvRf3pPl2EnG2XEOoNoI
	vpPhlGukV95EMvhhq9JoCSnxq/l99dpeEw1Wd01ppy9dM82jDpRS5ULSwMJiW1+uSxw==
X-Gm-Gg: AYBFou3qSlGC+TRaVNtVnlTjc4IPOU5oN23yN12TgETlaigxI3FujHXPLxTaAt3E9/D
	BzHQGnHe1C4jAsXz6St1jzezkcOgQAmPd6I5VJ0a6lR9xGso9Ke2/ZkUUg6YvBRKNQE0XBcshUB
	uxw6LFK/kbh60yoP0MOWpKqkNeSLfy2S7fuj8B/1EtyJMOf48ZzVucqv9KMi5rEJbWxsJpYGalh
	cJ3QKkAhUfxH1eSIeFvbEVEW881IFRodqCcYidMqe4pFlQHnqFsq4n4ukdrlufWKzVebOPu6y37
	1wg07ix+BUl07YecEH2AqhVig2MGfhVeGK7KeNI2Vk0kujAlk6FCPHNVAOXXOms+XxmXFfUoOVB
	2ITuscyCN4qcSQR9Cpr/nGmJcY7IkimqaaQ==
X-Received: by 2002:a17:90b:1d46:b0:3a4:cfc2:3517 with SMTP id 98e67ed59e1d1-3a4d1b5dee4mr770916a91.49.1790762542436;
        Wed, 30 Sep 2026 03:02:22 -0700 (PDT)
X-Received: by 2002:a17:90b:1d46:b0:3a4:cfc2:3517 with SMTP id 98e67ed59e1d1-3a4d1b5dee4mr770865a91.49.1790762541848;
        Wed, 30 Sep 2026 03:02:21 -0700 (PDT)
Received: from [10.92.215.224] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4cb194b86sm2880249a91.2.2026.09.30.03.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:02:20 -0700 (PDT)
Message-ID: <050bed16-c250-4cab-baab-d3b766668f17@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 15:32:11 +0530
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] arm64: dts: qcom: pm8350c: Enable BCL sensor
 node
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-7-f5ca00889cf7@oss.qualcomm.com>
 <szrhaamkkvvhwcs67mrptuigkmgel5jixo2bqgk6rwi2kn3jdu@a275fnea2vlf>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <szrhaamkkvvhwcs67mrptuigkmgel5jixo2bqgk6rwi2kn3jdu@a275fnea2vlf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzOSBTYWx0ZWRfX3a+4MzqJcKWu
 PVUC0z/mmzkSBvy7GbMki56YagDYd4jnb72IKl2xvbVwSoAYI3iapAwx+KaIfz4Buw7kegDocL+
 T23xfjI2hnTwvIxK2tCNU3zqWgxOUvuMH8ytSbNfnkd9i9Xw7Nl87V/s7i5iTB3kphTVTv7ZF9w
 BafyRU7yNtJaKmu6+RveLZR1HhRnlYK3/UL3mPlYh91ebvW19DlZHObX1CvB70ZJq5GF0/R5gOQ
 FlrcMoOFT/DhtUPHW2/QZWnB3JmSnb2ylK6g7xD5TpCfTtq2Co2JxGWPjT1vxI19Bq9Dg4ft6P8
 Bi1c6MnvTr+auymrbrnt4A0khA4fG97JeIPDlRPWTyYRtrstbGC8Rs/cR9KAoOlnn/dqfK2bEU5
 lT5A31RsrzbtL2iCUtWdgRSTgDQp5uBy2PsofNMQnUVlh6SqPF++N8EFWTyUrGl8ZU9MArbxgXL
 HWvmr82Yi8HXlyNNrbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzOSBTYWx0ZWRfX3UdRTu8Dj+dq
 QumMm/fI21SC/Z29oJT6qd1P1FZTEVZHdLrBPiWoy3IuigX7uejMYXDsB7nNeXBqGYr+abWniJy
 oYZEmf7JcOs7Lyl6JdaQrriP59ovM98=
X-Authority-Analysis: v=2.4 cv=RZEFmFtv c=1 sm=1 tr=0 ts=6abcde2f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=9t18G-HS6d7wqxctyjgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: AfiXmfHEyD3ctOBrA8kTGMbM_zmTX0sV
X-Proofpoint-ORIG-GUID: AfiXmfHEyD3ctOBrA8kTGMbM_zmTX0sV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300039

Hi Abel,

On 9/29/2026 6:45 PM, Abel Vesa wrote:
> On 26-09-29 18:39:39, Manaf Meethalavalappu Pallikunhi wrote:
>> Add Battery Current Limiting (BCL) hardware monitor node for pm8350c
>> PMIC. The BCL monitors battery voltage and current, providing hardware
>> interrupts when configurable thresholds are violated.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/pm8350c.dtsi | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
>> index 1a24e6439e36..52b5fc1ef9a3 100644
>> --- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
>> @@ -20,6 +20,17 @@ pm8350c_temp_alarm: temp-alarm@a00 {
>>   			#thermal-sensor-cells = <0>;
>>   		};
>>   
>> +		sensor@4700 {
>> +			compatible = "qcom,pm8350c-bcl";
>> +			reg = <0x4700>;
>> +			interrupts = <0x2 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
>> +				     <0x2 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
>> +				     <0x2 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
>> +			interrupt-names = "max-min",
>> +					  "critical",
>> +					  "emergency";
>> +		};
>> +
>>   		pm8350c_gpios: gpio@8800 {
>>   			compatible = "qcom,pm8350c-gpio", "qcom,spmi-gpio";
>>   			reg = <0x8800>;
>> @@ -41,6 +52,7 @@ pm8350c_pwm: pwm {
>>   			#pwm-cells = <2>;
>>   			status = "disabled";
>>   		};
>> +
> 
> Drop this new empty line.

Thanks for review, will fix it in next revision.

Thanks,
Manaf>
>>   	};
>>   };
>>   
>>
>> -- 
>> 2.43.0
>>

