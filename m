Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F32C3033EA
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Feb 2026 11:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771242503; cv=none; b=Nx/F1+O2ejcdDKwA1zzdpnF8605/WxYjg0PUqjkPd6aiAp9/e1SWhWoWvlczpPtlSvXanCOERkLuKSNm1SMMNOXf6P9h1qYT9cZlFgXKY3uDiWJUIV3Hu3tPGhqoD3ekA6Cp4LlkifPd/XK286slRUtCld4rNpGzxX/CJAlsw6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771242503; c=relaxed/simple;
	bh=qwjysGjuC4LBHkczyMiF/TwadNUOL4VjAFK9WAGwol0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kYPRXRzgWY7Wh+Xr2ZrgsU14LeajflN7smZSGNiNFVeqPxjudEsMEnrhrEy3j4zmztOM+3iyIKIbFwFWxKb9b/bfg52nUSSYisx8A7brNB0eji9j036EqlK4nQ29uq0ewNc3oIW/2QrmTOIMLkIadoywbomspCgLZoK4RBVr0/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T89IcOM1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fFP/m6Lj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T89IcOM1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fFP/m6Lj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G8gZVO2803382
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Feb 2026 11:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qPz/r+I7ZPnTWvM7FzhPzlDlleVHYkZ5De6HnTOA5C4=; b=T89IcOM15Wjz1Dp3
	TUPehrZNl21fePbqNXyhfSFQwQYtRMT0SBto4/uScpmnkK4ODyH/uQ0pdAHqAjmC
	aZyzhHrfxJraNCK9rQHI7xdxZWy4eOs9/U6k8hprLqjQGsV9KmTuHpRVjibpy58B
	uK2uuEfEfKMQKEKVkxDGhaFEP2l+YgjhZDNb1v5bnPk2Fqxw/Y2dsVoXqZ5djT3h
	saF1xK7d+LpBKOlMtYCstZasbFZpP7tVCvhFWZKIuys9dnXHD+ou8AjfqIQ/36zH
	JgAOZECud0jbQVCPQsN8mYqUVo62vN+9t4nNIfH36it1B96W5mt3CUodSBtRl8jb
	wEIvNA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxugeyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Feb 2026 11:48:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89545f12461so21259156d6.2
        for <linux-hwmon@vger.kernel.org>; Mon, 16 Feb 2026 03:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771242499; x=1771847299; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qPz/r+I7ZPnTWvM7FzhPzlDlleVHYkZ5De6HnTOA5C4=;
        b=fFP/m6LjpDlCJ8CD+VUibwVewtTazOA65aeMnMZAuGuvGocrSH4LPL52611DhhvgSU
         0+Jioj5LU6SU2fuZuge5lQ/x/Y6b31AcjHkR7+Clm3+guffEwK3JzX5CWRVvxIxC8ItX
         OF0hRRZw2Ys0vJNAOwckwKWS6orWzvIrrR/F2vs5P5X9RApc+e0k3y5u6rEe70SG6rj2
         +uKwo1ozZt+kM1vmpeKLntsp+1154DfXaUrIB7XaYF7REkfZDLL7iClaCLb7mE8pLZD9
         uTwDio4carzQBBDdowwb7U81TieR8NqtHqt+Btycbyzhyd1Qa2tsarXFj4pPWFNLG6vz
         Y7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771242499; x=1771847299;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qPz/r+I7ZPnTWvM7FzhPzlDlleVHYkZ5De6HnTOA5C4=;
        b=iyxyiV2G/lzzoqzhXkGIjZoClxAgap6m+MjHFK6fWc8qsdpL7p3yFqQ0rnLlsKUCLO
         grrTod/qQH/MIiryCyUCtFcU+RBtXwhAuJOc4a2Oz5axlI9zZ3QVHfGBp9if285ARJum
         LSSSSrDtwlb+390//1Uzckxku03zBLFh7k2jePjQpfLnA9IXzN9zXVHqFYG9s02sATg6
         LtVpBXEEs9gUdDMysyzUNZ800hR3lmHIcO1hf4vSwe7zFTxRx0EvauX3RuYfS4+1SjQ3
         mYmbafXgsPVym0+puQ7xzjSL2NcTabmEoJHFuX8UD6cyXUFlLMYOmHIfDg4BDOLDPnYO
         IA+w==
X-Gm-Message-State: AOJu0YxzYvbwdAyAsRG/h8rQX0ghlb0ncs1M39+vjNa28/qyTEHihX2n
	HGLDvf/tC/QX4r42XwZBkBIaoapZsI7/DPiOlqwRuEOEwOZlIOVEEhej16YKsLXu9VhtJQlsej6
	7ua611XB66xpnHNcUM9/bRhicuZKFSBuK9xDGhRxjiNRwGQlIMFwddlO34GFns4WlZw==
X-Gm-Gg: AZuq6aKlZIIui6tMkH29gGZ7MNqaRWvewon8+JafVhI66nRtMpFF9vXEPLaq0fF0j3O
	bBUxZ6CLFjmtlh4Timpp1H3+yNeSGzfFygJNix1hTb1khHHwHNKiFHHJDYeNIJXwonh+AlMUvX7
	MQsxkMXqXYwJZT0ycTVtuackwmS6liV9jzOGfM61IV/LJspM5uHsaRehgcr4MW9u9BKatHvW16P
	T4Zo9jPt4fhbkRjTzXSpuIH08tvPwI2Fb9CKkAYMC8UhpuDL7XzEQd4WKoSv9cFMquiQYDh2iWz
	pJ7H+t4UFV+Rpfp7sHn2tQ16+qZ/4FYs77Un8+tkqbYM0C1IipOa01Vszo9cVMqUDjjcXpv7rBL
	ahe33t8nyVQABgl7uRmnlpu0YI6F1ONZcTfRk3Wonw+qT9cO9224pZYp9r87qnO7L6ysjo+53+H
	0IXvA=
X-Received: by 2002:a05:6214:8001:b0:896:f317:17dd with SMTP id 6a1803df08f44-897346262ecmr116266396d6.0.1771242499497;
        Mon, 16 Feb 2026 03:48:19 -0800 (PST)
X-Received: by 2002:a05:6214:8001:b0:896:f317:17dd with SMTP id 6a1803df08f44-897346262ecmr116266216d6.0.1771242499112;
        Mon, 16 Feb 2026 03:48:19 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fcb0ab637sm226904466b.39.2026.02.16.03.48.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 03:48:18 -0800 (PST)
Message-ID: <91425550-35f6-4941-917c-f639dfadb42d@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 12:48:15 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: pm7250b: Enable Qualcomm BCL device
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
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
 <20260206-qcom-bcl-hwmon-v1-3-7b426f0b77a1@oss.qualcomm.com>
 <98ad13d8-82d0-4def-917d-b99cf455c5f1@oss.qualcomm.com>
 <fa6ce650-42b8-4090-9c80-7f4e4c85a96e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fa6ce650-42b8-4090-9c80-7f4e4c85a96e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: j8fe_ZG7kI1RX1CIKznrsYyUf-F3EtZ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEwMCBTYWx0ZWRfX5VEAaBPDtqEp
 FEOHhjN+0jrScPVzsw+E8clfeB5SOuBcxx5Q1CjU+qgQGlibzPwguLrI5KDSnlHERe/0SLs8xj1
 q1yw4OhR9qCMpdOPj0WbnWzvfY1bxkEl6R6vLrDgFWBKrd86SLD5etdxdWyml0C0yas9Xm54QgM
 BFKPlOYah/kObwsSrmSuxz7Dkwy2MJpoxb1kCCDfMx1lzFPa30Qghsk4kGO31Q42F1vvI10iCFt
 r6wt79J0k/sw1/XUUoLYHk9RAVcujn8OghczGm33nyk2I8pH/OQuDpjcrJY7jbPPFQTCBqJXXl5
 1yrorWdAo0Z2Q6KCOhWbv0a5lSypGHs2Y+Wk+eWTy+bP4RyafhKbbREhMM9KyKdHcUWMwXUeBdA
 B2LxYr2uzZICva6R+vxc3VU0J6VqE4l7ErFCjpk9pMl46RO6Fpcwjscqu2Q0U+siAbtPGGKv/vx
 yaYfxqig4URceHVuMqA==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=69930404 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=TNIZ4HkRKK3UB0IB75EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: j8fe_ZG7kI1RX1CIKznrsYyUf-F3EtZ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160100

On 2/13/26 12:55 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Hi Konrad,
> 
> On 2/6/2026 2:41 PM, Konrad Dybcio wrote:
>> On 2/5/26 10:14 PM, Manaf Meethalavalappu Pallikunhi wrote:
>>> Enable Qualcomm BCL hardware devicetree binding configuration
>>> for pm7250b.
>>>
>>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/pm7250b.dtsi | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>>> index 0761e6b5fd8d..69ad76831cde 100644
>>> --- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>>> @@ -202,6 +202,16 @@ pm7250b_gpios: gpio@c000 {
>>>               interrupt-controller;
>>>               #interrupt-cells = <2>;
>>>           };
>>> +
>>> +        bcl@1d00 {
>>> +            compatible = "qcom,pm7250b-bcl", "qcom,bcl-v1";
>>> +            reg = <0x1d00>;
>>> +            interrupts = <PM7250B_SID 0x1d 0x0 IRQ_TYPE_EDGE_RISING>,
>>> +                     <PM7250B_SID 0x1d 0x1 IRQ_TYPE_EDGE_RISING>;
>>> +            interrupt-names = "bcl-max-min",
>>> +                      "bcl-critical";
>> We should strip the "bcl-" prefix, since these interrupts happen
>> to be under the bcl device
> Ack
>>
>>> +            overcurrent-thresholds-milliamp = <5500 6000>;
>> Is that something that we expect to change between boards, or is
>> that an electrical characteristic of the PM7250B?
> Yes,  It can change based on battery used for that board as these thresholds will be close below battery OCP spec.
> It is not based on pmic spec. Max current threshold support for specific pmic bcl is taken care in driver pmic data.

Okay, so this property must not live in the common PMIC DTSI then..

I think ideally this could be communicated over battmgr, since it already
has a lot of information about the battery that's currently connected to
the device. Do you think that would be reasonable? Would you know who we
could talk to internally?

Konrad
