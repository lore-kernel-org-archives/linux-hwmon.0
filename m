Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2312D7DDB
	for <linux-hwmon@vger.kernel.org>; Tue,  7 Jul 2026 08:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783411710; cv=none; b=YTkNrVwmrWiyBce6BrZMIV45M9RmWGYo/3xfBjYG5CrhFd0/vsiljYLXyV4jHLuj7NshKmEuUFmHMwplWFhfg6QIKUNB9okic6X6M1lGJwhs5FXmW735YeGNGjkLIAlVb5hyxpJApT/6NJTywRxDKnXBqkg8pymAEJNOgRnj6JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783411710; c=relaxed/simple;
	bh=A2SY17CAeZ/j2znh/Nh29scTgcl8twuNHXIs5ZQBXac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZCJXT8SScjWU/+M5BRe6FwX6Z0sl+/vUNgyLE79uW2crLCMt57kwOVXurNi+IeH9ok8+TkficC9X9AsXeNUnYckMIeU925me1yHUVltDfjq66xqt8Ve7Mbke8NXSVLnWq/aqCdmeZbaWNmY1ivZEs+47qXTqxIlhD/grJ8juquM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JjChqHs/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZbZD9G4H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JjChqHs/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZbZD9G4H"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748fmO2514319
	for <linux-hwmon@vger.kernel.org>; Tue, 7 Jul 2026 08:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TNCFc4M275i5hqwVvMbqgQb+aYFA0UWni3Igt//9OC0=; b=JjChqHs/Y0ehLuj9
	+Ek57vIafHifloHM5Kj5V7Q5pLcWdKiLeC8D1eR4Xlto8WqLlt1PDw8LV2h81EhT
	w9NfbePsgKMT17eiwjHJQwcxdjKjHH2tWczk+AY5U7Br3/8XRCpZfl8vr/DL2hzT
	ovFeczrWWTfSiJUJ1cUPIbogrRfhfPmNLtJItBIjU15L/Edt4cXG9TamUStaHpSt
	Xm5oT6/NDi6KP3t4FTfLvCja+AFrh/UoRRurLs/0MWH0GHKoOlymRQo8CS5/x6/K
	namP9jFL8NamLaKj7qm3x20gwxEUq5Ukwe2n9TEqv6d6v/MfchaF47CrjK2h0sb3
	YD/F2Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8gxsa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 07 Jul 2026 08:08:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0199faafso43956851cf.3
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Jul 2026 01:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783411707; x=1784016507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TNCFc4M275i5hqwVvMbqgQb+aYFA0UWni3Igt//9OC0=;
        b=ZbZD9G4HNYGNP7CDGb/4z5JJlIshgyJYP/AZYJpe3ZK1UoaFvnjBi6acRo9msvdr7K
         q3ss7Rda+CPvXK3PtCQlVR/BUaXNlCen8ukTiApEhDbz8WYI2LpufyB/pVW9xkh8NBxc
         jB6oej8pLrmUPkvfbritqudR2xfTTu3nPqN4LX95LjR5M8rm53hhWotPh2ka9Gb8vbPW
         maKKcbIdvIY+gme/Kwhi74Lxyyug/kNMZ3nc3GRcARbYl/dlJlbVCItuJ2Sb7i7x7y6V
         kViHV2AvF3NlBHcVs7egfGUas1TDSCmVP86RuJlCGHGbtQaMlS9A8RlexBFotakgGybV
         lMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783411707; x=1784016507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TNCFc4M275i5hqwVvMbqgQb+aYFA0UWni3Igt//9OC0=;
        b=l3J1owEk22uFgWisp42qJzrEafOzikVuyaOV6MSHlLVHkFtYXFbLB1d/83KOy31wa0
         +fXofVvmdSROfCAlvzvoxoDJgPCJqHcl44OIuxPnUfVDLWm8jymwk3221yPO0evaJl4X
         JgJS2Gzv1eJELgfaOA9Km/pV40tmAYv27EvOEZPaXTgx1ar+Gh2hdj4oeDLWCjBBKkyK
         yRqjhdd0zpU/Xb1a3hgg0SmR1+VCVOqZ7RXLJJUhRPc16HoHz/fFCJ6q+OijTNqux+z3
         JqADmIomMvGvc13ZywCh9mB2VSBHglYAaZC7g5D+cHL4zOCdmYvaqH3m+nxAcAWSfPQY
         1vwQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr07Z+0KsiNT1CnkUtpYpYpB3onmxiln0MBAJX4jt3j6cwxlEboEG7e9Ec+aHv+phcqEHgNMGWBnUunVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxC76eayOkqJvDKMqFi+vE2wFCn72JZoDjnQzVuCkqGXNi/fBgY
	Pnot1tCmrK2QU4ja5pF1w6Saj2lKP83rgSAjcNvmtMdpjxs4QoVjDD2g7O3Ir30Ks6vH6Y+lBa7
	DNvLGYkL4PGYzJhjtNgogIhz+UyLlZncgDBgwk8h/39XH0G0vk+PoJM1xLtEtR167IA==
X-Gm-Gg: AfdE7cmBK4WHDXkcaabpZ+R9NRKm5RVHfIBg+8bt0/tfk9iuDWcudkIo0bl+B/CYNCH
	IqmZ+TQPv5k/+18MHalr4CJc49dYhWZfs/odoK8Dk6AVP8cn7F+4PU6OtjIf+JVP/s1asSRoAUE
	jWC1PDG904U+Ayn0/vo4GyLGjpGfOh5HAAZ16vMVSMz7rwy/93OYNi9DwdWShuVRxdsbQ5LjFIt
	wdquN5YeXS9js2QE18pEHGF1pm8/z4UHymnd3IJ9McZGKF4GBXvhAcBh/h+RAkQdL6UrjuMHIZg
	t2fOXWc9/W5X0BbmYvRDinXp9JUDUxiJSq59tCfnS7PCY53X7AHhhCJ9hnrNRlY811F/yWiVdJJ
	z0hLjk56uv5BiEwh9iz2w73PQrEEYFMBBuO1smPTV9RVPUYQBfkiCWEMVNdU2xFyGmsDdS4vjzA
	==
X-Received: by 2002:ac8:7c49:0:b0:51c:1132:c800 with SMTP id d75a77b69052e-51c747a137dmr43719791cf.19.1783411707385;
        Tue, 07 Jul 2026 01:08:27 -0700 (PDT)
X-Received: by 2002:ac8:7c49:0:b0:51c:1132:c800 with SMTP id d75a77b69052e-51c747a137dmr43719601cf.19.1783411706797;
        Tue, 07 Jul 2026 01:08:26 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b126sm31391476f8f.24.2026.07.07.01.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 01:08:26 -0700 (PDT)
Message-ID: <8d579153-efa5-4c8e-acae-87f3bdfbfc24@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:08:25 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: embedded-controller: Add Lenovo
 ThinkPad T14s thermal sensor provider support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
References: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
 <20260706184648.35613-2-daniel.lezcano@oss.qualcomm.com>
 <20260707-armored-azure-terrier-4dc3d3@quoll>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260707-armored-azure-terrier-4dc3d3@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA3NyBTYWx0ZWRfX1N0k7Hbtwmld
 YIwjpGgR8e6apMBrVnlt5ep1sNc4me/FUuSaM8W2ploU7/F5aCLICgb1GGlRGip1KEqcZV6WDbB
 PbM0QORVLNb4g0sPZty4TN2jyxL8OFm0KX6jWp4O46oziWS95ptKj6KvJ5cFV8wmwWtkUJ9ee3J
 +VQKMA8dPYn9IZBkZU/MXcxSDdqwVcV0Ft87hRitVsfBaLRyhecTnSvnM39PN6+6B1FPDsXznKk
 wHpCVHM743o8qzqcbQpr5ONo9OYQRLrilV0uQIvZHPZI61SI9SQPdt/9vTVL1iR+6cex4Klw9fh
 SnZk+N1H+F2xa/VwSlmtXH6G8B/mn2zwmpobm0EhnRM2LeUMTjwXTeuL+iY4ZROSP4HBW9Cy6mM
 z9aRf0Qt17s7b3h3ub49GEC/hN+UZjFNSnb2OwacWxVgQeZxPMsCIBiiIA8bY14LFHVSE4l/jqp
 OKC7BwPTIiyTlHnmTZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA3NyBTYWx0ZWRfX1NDs/jzsygPe
 OJCgMBk/7xyfwer3jfor3DaMR2aCLS2bCTDc8i9WubJffitXPorAquWRp64XmLfus1r2MTxuCbE
 5uVsfx0qbJ8AQ8NAUc/pMCb6btpCjog=
X-Proofpoint-GUID: jG1ItH6U2tRS6HHxfurLyVFAGjCRvNao
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4cb3fc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=dgN5xaoR74Ub-rSnYJMA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: jG1ItH6U2tRS6HHxfurLyVFAGjCRvNao
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070077

On 7/7/26 08:38, Krzysztof Kozlowski wrote:
> On Mon, Jul 06, 2026 at 08:46:46PM +0200, Daniel Lezcano wrote:
>> Document the Lenovo ThinkPad T14s Embedded Controller as a thermal
>> sensor provider by adding the '#thermal-sensor-cells' property.
>>
>> This allows the EC temperature sensors to be referenced from thermal
>> zones in the device tree.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> ---
>>   .../embedded-controller/lenovo,thinkpad-t14s-ec.yaml         | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
>> index c87ccb5b3086..0d049979e35b 100644
>> --- a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
>> +++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
>> @@ -26,10 +26,14 @@ properties:
>>   
>>     wakeup-source: true
>>   
>> +  "#thermal-sensor-cells":
>> +    const: 1
>> +
>>   required:
>>     - compatible
>>     - reg
>>     - interrupts
>> +  - "#thermal-sensor-cells"
> 
> This looks like ABI break without explanation.

What would you suggest ? explanation or removed from required properties?
