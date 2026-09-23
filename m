Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A41479863
	for <linux-hwmon@vger.kernel.org>; Wed, 23 Sep 2026 10:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790157882; cv=none; b=bQvB6nFn7JjmsTLUeGxa20wvLQNk/PdZhQSvzeV+Zotp/uuPuSWLxx93kjrN9y9749TvLKQKDfmEInnVmK+kbDshq0qo/Ul20IJ/xpFC0SGGZCL/B+0noLLvxqMjYRkQvlmXJu/du8GCiYe3ZtcEqn7SlOoyOjkZekQY8kW4VbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790157882; c=relaxed/simple;
	bh=FcAC2kL5ib53ysCba7eguY2e0KmUYIG4Q4SdHWnMupc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iq+93od1vyarlTaa+/eG7r8zZyeb2z3edk6KdaqBSMo++IldbC3l4o/xEle8cxDO3K94/dquXdCPBBq4A6wxFL4gnMaH1RtyXnDlqdrhCtt7FGvjM+z/g1pVZr+BIKOIj/nOlQUuA7z/x+h+6X7/jLzoTfFLbPLE87wP5DJPtUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSPNKGEi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BP5uNvXM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSPNKGEi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BP5uNvXM"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2vw52952179
	for <linux-hwmon@vger.kernel.org>; Wed, 23 Sep 2026 10:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KIcAJjWyVPWk87cq5e+oRvWxXeEjdLFGt91qD/yNc5w=; b=YSPNKGEiQizfoukY
	R2LU2Ai+RmE3DNItr0XCdVGKUL3jv6CXJKcn+1Qk6OY3BM/MXdTBBiRfJTWIEXUO
	xayVR1qrISBnzNlANEMqG164nCrAnLFL/ebbdnAbiTJuWOPE/UzWQDO4sucIlOZn
	/XN6QhQcvMwW0jZEP1+IS/SkYrOEZ4ZiA/WFSF/LuPwrjo3JKp4Lemto9kbFpd41
	Vm5CN8Njq0BhcbS8tW+GaVWQzeLxycQ5n7qtM7tfJCAU0rVDrffQ3HPoqsxth85X
	kxGRE40s9UHSwXMgu7q7ZqbI+v9cJpUEGjX36Q3PzMs35RC8aj0HGX54SJgONMzr
	eFNhmQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv32qt8tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 23 Sep 2026 10:04:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530d522a20dso2229041cf.0
        for <linux-hwmon@vger.kernel.org>; Wed, 23 Sep 2026 03:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790157876; x=1790762676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KIcAJjWyVPWk87cq5e+oRvWxXeEjdLFGt91qD/yNc5w=;
        b=BP5uNvXMYpEKSD3oNHgNlBBMcpP2ChCh5lVHh++f5cVeLWNTS8nY8mlKcEod7cbxfd
         qi4TownxJQjWIGNavfGg8a+mqJg1NMmhKVESP9EuhWZTwWu46EWcJBiDzju4PsPpntbH
         /GwyzsvTzFbkcAsdZNuqfOZJ/2uxxlMRO4rVFWm0pa0bTzvSPRkFlFQVf+rYsOXnx2Z4
         AVDveQmi8ttixAcv8O4cewXJd8UVuYWBQtppOQPvkkFPjFDI+VPMH1i3jK1/ov4zKrjP
         v5KLwZlfSIlEsrKFRqtBB51IOfXuDwTaQRXc0eG5/8k9mhOQEwL4ArFCUttCLCRcRa3B
         oasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790157876; x=1790762676;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KIcAJjWyVPWk87cq5e+oRvWxXeEjdLFGt91qD/yNc5w=;
        b=r9u/JWZiqb5aagQP6sY0+D4Z1mb+CgMOubKmm391SZHpuioLpBj+DHbb3mPrNOZosu
         zOZwaXMxKeoL6QCuQ7l88IMFvdJWQyd5KdPo5+MMaIV5eS2YbdTqDG+sF0HS+zAsWr07
         XFFBWZaghGSVXBp1ywkApeNVj+n2L5jw8BXRkupV3/XBT0jKa/wZUs+Y/T9o8Ck1Hbhz
         IABCllgciT6WV+6LFrt1XFiFYOPjrrsGPlP9n5r81OymzlyBq6KxpCo+fcHQV2FgtyOw
         i35NnjNm/Bb9xB4+LKWhAZ+zncjaxiMPOBa9bPqvP+yEvKTrtNPhJbiVvo3GAQE6Pspx
         r0vw==
X-Forwarded-Encrypted: i=1; AKwUvBx+ejCzqu3XGymZwr2Mam6/laXvG31D9bsezA96+EC6dT1rEXB3xTXsiyy8BTKXqWWWqbk8ZJv/dyIWlQ==@vger.kernel.org
X-Gm-Message-State: AFuF++njHCH27ObXB3BbC6DLmUA37DApcD44oniWV2svWK2H5lD54BFV
	HDyotpjNHapDbNkGDfeQUtb8mCjx6T+vn/dV1jjWml6mn+LXxXAE90YQikTFyLIInh3lGB38dRS
	Ja5wg5j2e/6Xt/YenJAQgKvHdyjG7hTmqMEqZ/P8vhETyCeUoAo5DEo7IuobU/6SZxA==
X-Gm-Gg: AYBFou2PteXWXHBcX/QO1LDVEdGGdippFOx45TULQoMcO8513MFB2g2yQ2O7aBgiHQx
	rmDE735reQTD73DJUcsPUVhbUnDOVTJKhHglMf8/ntjpgtLDehNZvrRb0M8DrMChkM1ggmlDxeq
	4ZvQcfU6YSUssco2Dx6PZpJAx3rpUY8tfPEyO/opRzL9jdYYbUv73pbBmPrkjdt04wF0HUslOUK
	21w9NGjn6cxbu5bTpxzjllEwnbVNwxqhkno5zxcrOtT3XOlqlGbRVuOAiD1RjEpz1bF9nhXwxP8
	D4NLeeuISlw0glgujot+y8AMseSJrRWIk/TfaQNM4JQD+SKzDFVKFTAl4nMHaJd96le6+bAlduu
	S/Fnzdj/BUskjcuVlVN1tcA==
X-Received: by 2002:a05:6214:8624:b0:912:3334:f40e with SMTP id 6a1803df08f44-9140c50a449mr27443096d6.3.1790157876181;
        Wed, 23 Sep 2026 03:04:36 -0700 (PDT)
X-Received: by 2002:a05:6214:8624:b0:912:3334:f40e with SMTP id 6a1803df08f44-9140c50a449mr27442796d6.3.1790157875672;
        Wed, 23 Sep 2026 03:04:35 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae33fd11sm84954966b.7.2026.09.23.03.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:04:34 -0700 (PDT)
Message-ID: <8c9777c5-f323-406d-a996-17bd1a5b8946@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 12:04:32 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: glymur-zenbook-a16: Add Embedded
 Controller
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260922-topic-asus_ec-v2-0-0bd923d1b853@oss.qualcomm.com>
 <20260922-topic-asus_ec-v2-3-0bd923d1b853@oss.qualcomm.com>
 <uv52rxc6llmlas45mejbeeriryiozh3v2f2itbvfzo4f2sgazm@ly37763jkftd>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <uv52rxc6llmlas45mejbeeriryiozh3v2f2itbvfzo4f2sgazm@ly37763jkftd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SJnXx+vH c=1 sm=1 tr=0 ts=6ab3a434 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=SILNe5Qj54eFSe9Pf8QA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: d4gzkMRomjBq9mqLL9v88SJHGMPJWPXZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOSBTYWx0ZWRfXzKLzBpPlwvQK
 4/FT9eadtJ61b1yOJHUslG7A1XCwDNotQ2qehvjkjLHZpwGkiJNJJ2Qg9wRl/30C5ABVAQk5z2C
 xDMPNG7hFfCF3RjLSxk7xYqg2VRn0rM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOSBTYWx0ZWRfX4FHF9+OPicK4
 P0jUSTNViC32MmZtkH9775Wh1Y4Pm+vI7/YEiicvUKR4Zyvuoo3Y9ISFcuoGGrlQzk42j4QXpZU
 zCy6xDydsCOIyDP9LjQI6+NBsDEz5dNMuybR7fzpMOkg+3vAMprhpYV2+KgQuRITrwfZWa0EEHU
 t90fqyT1IrebzxfnX/NiAa/N+J5s36XXRufsQjC7wQ2UaSJ2Zg5jvmso9SaU9ToNm7Va0XxVNTl
 LdOwhrva4AAld0crxhuTitG7uYhSP23F+9H9fnoZNwQ11lgYai+p5uGoIzTTzOisig9mSAbUrGC
 qJ8/VEdnjOjic02fTB0tQTKmkjuybOyK1yknizD8bYvpg1dMegx7LgtgyZZL4TD0IGey9dJPEQF
 ijgiEb1Bfk42YwMU/QXMO0YmLMA71ssmxMnv8zPLsVgtS6lfJHzkRN0htAgswGPwrxlS/3I/pnD
 y9VsoyQA2kYULpK/U5Q==
X-Proofpoint-ORIG-GUID: d4gzkMRomjBq9mqLL9v88SJHGMPJWPXZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230039

On 9/22/26 10:31 PM, Abel Vesa wrote:
> On 26-09-22 11:33:38, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The Glymur-based Zenbook A16 features an Embedded Controller running
>> custom ASUS firmware (which is loosely based on the reference Qualcomm
>> Hamoa EC one with a lot of modifications). It provides keyboard
>> backlight control, additional temperature sensor readouts, fan speed
>> monitoring and a number of miscellaneous functions.
>>
>> Describe it.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  .../boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts    | 15 +++++++++++++--
>>  1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
>> index 40433dc2d6cf..d3356fcd25f0 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
>> +++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
>> @@ -670,8 +670,19 @@ &i2c9 {
>>  
>>  	status = "okay";
>>  
>> -	/* EC subdevice @ 0x5b */
> 
> So what is on this address then ?

The driver spawns a secondary i2c device there to service some
of the EC communication

Konrad
