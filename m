Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEBE275AE4
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 06:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770962669; cv=none; b=rqHYqFhI4s7WLDN7Dhk8ZXnob7YnG8D0BOKBT07i9xloojGJgY2Sq1+Bao+1ApH0eGDG91nQL4Hiqa2sWR53Cya8oNGef6eB2dSGurOr7Um4nd/VKcrBz/gCtt5x+HN6dLC/rYSY8B8HBG7lhqPo71RPa+p7esQkHv8LWMjgUkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770962669; c=relaxed/simple;
	bh=rjn4uS5Q5xBLLj0PgsfNVNXngHTCJ/gdwngN/hdD2AA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oqfh3kD4wlkZTa0bFoo9HnbbX6NuXMTrX+lrXzA/DcwswMAEDUGPFQqQq4cI2Cn/lEqRH2W19s5ANrKJdoxZOEVw4Brm2svjY+w9Xyv18HJKgS6rF9/9BcZ7kCRg41B2uMviaL7idXbA/lbbZkasaOZvVdh6b3H03DdM1lflDt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rwdjd1p+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C/ku7Ptx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rwdjd1p+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C/ku7Ptx"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D0BpCu2733827
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 06:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SAtm3wjHBikGFT8In9EnBOV9rR/eOV8HdTMdzwZje7c=; b=Rwdjd1p++KEUqmdE
	9BsmosOhb2OCK9uG/Edqz3QdIF7+HZ+8gaR4wMO0qdQg0MZvyHapQesCRaL2RJTs
	ir40YSJUBZZuXrN9fSgnRXnaq12oa8lk1+nPINnwqxXwCG0yT9misi2ZquohRDgb
	hUB5FUypJNLfnRcFpBJrP7Au8TEM0G9LHhV35A1de394eOsYe6k4rp8PMWbGs76N
	so4BJP21Q0B2IZSbipF20BaHOT7NSAyi2qZez+GDehY3uYfjJJK16JltQ9Q02pgp
	a/74AfwBvXvIvISvaeYghBwQZ5rt7EbJ+orBavYpovM3dwbWNEPgqiN8sf+2tqx5
	8g6DZQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9s6wrywb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 06:04:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aad6045810so5788205ad.3
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Feb 2026 22:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770962666; x=1771567466; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SAtm3wjHBikGFT8In9EnBOV9rR/eOV8HdTMdzwZje7c=;
        b=C/ku7PtxIiAt779I1bmk21ZVYAQ9xxLrZVYWlLk7tNRmyCcek6TlUwjHi2TbLL9FMS
         mT3MMGNvWRSaahGKl2X6V/5WnPJhwvf74hZOfEqB/faA4WD548q1iZ4bcrglG1s3qXdU
         ZwmyOTa01AhZr7LqCNTDfr95sz7pe4jdcg1fozmu/uT0XyQee7coR9a5yPbxgXaX7bjI
         /DyCwNuxIBAc5sxyWhu+hhs84+95tzDLpIrNeztw21iWYeHIYdzBwS1fa5tltA8ykINF
         NBqaKy5TnKO+UJW5/rURUxuPBsExPk49L5a6xTmzVnbtMS+xIM83N3V7PyR/kb/nNsW0
         99DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770962666; x=1771567466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SAtm3wjHBikGFT8In9EnBOV9rR/eOV8HdTMdzwZje7c=;
        b=R2R4H5M/vHdaFY/vQh4wBbrQ8+v4LKT2ccbGM7+xjYptYHSsEGX+ENbEuwVOx5DbjJ
         hdQta6EA2DKN+uio6H73eSDaw2a+6gr65t8yp/y2zkt33CwIYSBbMjc7fPB95SS75jzU
         rvMOizipRmVgxP6C4QZeqBhCB1ZE6bDrI10cxFSNyPqf8C++Dw5ICdnbFw+NL/YSKsUG
         pxhi7WUXsvIREBVIixIEWo6uSB1AG+utEiUPEjSZTlE4/ee3qGgzQhofdkPtyFBItNdU
         MCAphIwXigA6Eo+xGc2apcEERc5CJM9GA5KpuLpZAx7SltcrUt8udeGODKoNk6tdBZM8
         Tf2g==
X-Gm-Message-State: AOJu0YzfzV+q3Svqs+Q+MR+k4oj7/M1plqes2Xie4xXwJ5k/r+L+NYV1
	9n4XEnzU+uq/MPUrP5OcoOVbLYITjpvowgdFraAI0lydS5nG66h71WkyMAelmmIhk3ZIy46xb+6
	YE8HKC2kNjfmX3Emq6Ou4QT3IFosKTiDMMp6+lJdW+VbR9IpTR6Dlk7XJ0gvNFHRogw==
X-Gm-Gg: AZuq6aIXzgNXn+Bx8riYmakD8sfFCrTFsxxBVsp/wd6olt833EhNHw59Dt6nGcMdjjh
	JqdC/qk6CCDt80ilTuuQ3yHXanQfE7u9BYR0uuKYZmzwzaf1HwWupwefNMK2dTYsd8dj7tE5Dkf
	yGpNEDy6t/CUj5DixgOr9X8MOTGn2kY5tuOxu56+hIFSac2/78bZyW3+DEJI4Et/wEXsHoJA9lo
	pzFoRw9fMumg13dfXBKKnR98AOw2PNagwUvSt2L5Tg4+2+CyX9KH+oY919zQztzWlHdolrlgp6z
	2cGyI+Q0A01hOR5hYmbrr5gQZunFMzxqE8fkTmSXwTTDwSywt1Bu1KLETh3VekcI+XANcIrd2xC
	tL1bacwslWhZfrC1+i5OrSSQZtsVJ/ABOCuCnxz8LmnWCX2bkLx4nmtSRQw==
X-Received: by 2002:a17:902:c947:b0:29e:bf76:2d91 with SMTP id d9443c01a7336-2ab505a365cmr7959545ad.42.1770962666508;
        Thu, 12 Feb 2026 22:04:26 -0800 (PST)
X-Received: by 2002:a17:902:c947:b0:29e:bf76:2d91 with SMTP id d9443c01a7336-2ab505a365cmr7959215ad.42.1770962665954;
        Thu, 12 Feb 2026 22:04:25 -0800 (PST)
Received: from [10.217.198.130] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab29998eeasm73094635ad.87.2026.02.12.22.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 22:04:25 -0800 (PST)
Message-ID: <15fe2128-5a88-4140-8aba-0e8d73350df9@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 11:34:20 +0530
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: hwmon: Add qcom,bcl-hwmon yaml bindings
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-1-7b426f0b77a1@oss.qualcomm.com>
 <ae2802d8-2eb4-4dcf-8212-d8f2a41a7185@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <ae2802d8-2eb4-4dcf-8212-d8f2a41a7185@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dC_1MF2Nm4oUPINjkyeYjQbFZAd8ab3o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA0MyBTYWx0ZWRfXxaDd4doRpOYr
 ZadFVNkNndIL5LOqXu8Iuto0k9sqwZfUmv6msLLtHWR7P3oMGRztS6acWAcFpCIflJAPWmUnGNR
 iM51hLhcFhYCxUUhqxp8Gns+xZQDhWgHFpVgj9qM8zBqmMOAXT65RACkZjQwJILGzkaouM6L7DF
 yIlfdRqvIHL7mD2xeqEdPeoTOTeZwQJJPhjOZofOZALw2Pg/BpoLwX0ERERnjsnWe/W2FO7jdnN
 cb+4UrOnfHna5D/hTUOh3AsegVgjX0x0svIWdvBAqObJRthAY9atsd4X2oiZ2nJ4tozGpsAM+eg
 CoKaN1vaF4B1RXBV7/LhYbor2h4ocTfe/5su5CQ7SQC3TMxoDMQzIssduExp1jPTHDllO/+rTJ3
 372X0sYxNAzvAdRE5DMtv5lNun41Nh4Nv/BX/D5CwD+rtwWvnV4BdBKjG0bya5du7S/NgfMWVkV
 OEPIbIpwWBn302WtNVg==
X-Proofpoint-GUID: dC_1MF2Nm4oUPINjkyeYjQbFZAd8ab3o
X-Authority-Analysis: v=2.4 cv=CLInnBrD c=1 sm=1 tr=0 ts=698ebeeb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=w_4w4FFK3glb3pLQdE8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130043

Hi Konrad,

On 2/6/2026 2:38 PM, Konrad Dybcio wrote:
> On 2/5/26 10:14 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> Add devicetree binding documentation for Qualcomm PMIC Battery Current
>> Limiting (BCL) hardware monitor. The BCL hardware provides monitoring
>> and alarm functionality for battery overcurrent and battery/system
>> under voltage conditions.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
> [...]
>
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - description: v1 based BCL
>> +        items:
>> +          - enum:
>> +              - qcom,pm7250b-bcl
>> +              - qcom,pm8250b-bcl
>> +          - const: qcom,bcl-v1
> I see that e.g. PMI8998 has a BCL block, would that also be 'v1',
> or something else?

I added support for pmic 5 bcl design from v1 to v4 in this series. 
PMI8998 is older pmic design(pmic 4). As of now, we don't have any 
requirement to enable it

Thanks,

Manaf

>
> Konrad
