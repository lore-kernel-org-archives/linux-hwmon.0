Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1B227B34C
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 10:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770980118; cv=none; b=kIVJRMQFVMN2ZyyfJPg1vOPz/R4p90yzGFIlJ8gNYOppKnicRdvGoNS5nK102vrfcX5wQpOIZfuLuezcaU8asQPNn0/i5kJKMfTr5LUtLYWD+HpWTHAbP6lWCPdbEdYnCMiqCiUeKl69gs+gKHVBkI6Qjw/ya1SAwilf7UYpubM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770980118; c=relaxed/simple;
	bh=sISlQNo22rhzeXky3hysxZuotkwCFL5UOEy78QbT9GA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UucvYjrx2X8B/psxAfZWbmGrrtxtpfYKLNKgmGxlz1stZSkv/Sn/mJjvfe/A2vikFC7piK3YhuuBWHpktqSAu7jphv2iY6WL0ASu1mqToiweylibOkTuyq7TLnSMXKeti4B0qYzVE+sp06VYhpu0x73Xpi775qFVOM1WX9rXCAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A7/NKsr/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I7MyPJi5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A7/NKsr/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I7MyPJi5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D7MVdZ2627978
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 10:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zouAPUjQyVlj9GPmB6CLRV7EXXiZWNs++RVmMWYgHOc=; b=A7/NKsr/Zmc8EQUY
	I/alKTHEJLsf5D2+jw1AOZ40DKII3mqwc83s4ozT+BPS2BbIMIIABDQlmHPl40Rp
	jChC7uwk37NXwBeB3lc+qdukdGDOP3QD9NTER9koqquSMRLb3d2EIe1Go5QKY/am
	uq0jme+Xe9d914Skre/j0TyT1D7SdrcMjy9G76iFdJitmSv9rJcB95lALH9Odivh
	cOnqGieSyX268kU+Tv3kOPVWIT4ZdXYA2O6yPe7ZLOQCC3k8/fvcpAphbaiiK9f7
	v1EoWE9/KICn04TvwGZnfGKwDI4O/bEGKvjbmHQmWlsciF7VFq8+/Jcy97AALBmN
	MdFzIg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ygurr25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 10:55:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c709a3a56dso32562585a.2
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 02:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770980114; x=1771584914; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zouAPUjQyVlj9GPmB6CLRV7EXXiZWNs++RVmMWYgHOc=;
        b=I7MyPJi5MunLu4BpjxmWX7x9LgdX6VplX3DIkLdaKyMenb/u14Rhv8N/NTf/VAPk+Z
         5NaIV/hRlGNS///thSMQ2x1ed924+0LVykphh8Uhv382CYKq+yXioi77qYL+pMKzxGcV
         HvOcZ1xgoWjwJET32+uwmmX5TOEPVWO5VBGGiYouNornzvFzdG0VBCBAdLpzLlH0nLL5
         ZoqyX7F90+psTJrcJLMnmQJo9I9o149cqEzOMjGW2kc8+Xu+7jW397jbE9rBiNhM+PSN
         v/h7cblSZuqa8SAuAZ/SxUxAuSxxowmkhO53rhLAiJSuSGbjWCdKLEjkMgJLgq1epEpa
         8CiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770980114; x=1771584914;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zouAPUjQyVlj9GPmB6CLRV7EXXiZWNs++RVmMWYgHOc=;
        b=rF/nVwo7e0+j1YKJiUfdvPWVERSEHTyvfvtXkAaS1zgdQClrJlsScnffipZltFpdib
         ERwjqLnJrYDrZV06WLEL3wP05lDeZ38AGIzF30dhp/pkTOwKxmq6rlEDsU1FJT3kOriD
         PXlJOqooQd1UBSfPTgAIuKxr9/4IOCRJZpITeorIxzsRP9/HLUPNPDSDmRT8QBzET4Y3
         5T++HdXZMOBu0EAHTEaEKX5OtaTI38lAAO0ZeHu6EcdUyfNYQqXq/RwaTliR35Qr5Qvm
         sTT5JTZ/2sjdk0ghw19b3LL3epXWIhSfNgivDo9Ec3rVLNN6JVeMFVpYY7vFlefXyCTA
         Ll0w==
X-Gm-Message-State: AOJu0YzbCRsrjs3JAglEprp40wmaOWX9bI2V859Tuffli/oDZmY82idH
	V6FpexVDZc8poXTHskWPVyIXzOxc4Mmo6N9YA+si0c7MJ+hHDN0AcHHRUmX0h0OVw4taG2+gi/O
	QeUCspthJGdlQSMUySxSPhqASfDY0Dy/wrwJOWp4cuE7ttiKgclu/8U0wQlLsrVxf6w==
X-Gm-Gg: AZuq6aJHYvuhqjnERmDk+jMwIO2L53hTLJmWPQEYvi2SDssgaDA76ILeHnVh0CH+k/Y
	iij4jFRtNunmeHgb5HdA6db2wLRpsGdVqU0113J3mOKxkTCypqVFKK+bRZ5wcHRvw417F9pMWYS
	3GJ/jtparYKqyBxvkDqLPmymLsFoCKFOd0pJ4T9Pfsa6/lhKDPmGpTFinmVNM6PFtvp2jAOXYpM
	ZW2oO8qUs3QXCwYKmyvvZT/8sSqxK6zAERvzLk8+2A61JKnlmP7fMi8xHlaxv1eUxnxKBJC6G7b
	NswJZrY7Ku3+0dVTQBn59ZYciFc7ksvVWtDT7Kwa6xxfRn9qLcm/V21Vzd7XtYtRaLPoun/wtwU
	yDWAcx5oOuOxYVzwfBe5M/GL1u/EtTVc0tS7LFuZ3rxAU3+In4blRkHyBK4mfh/5HQ2J6ltJhJn
	HBmvs=
X-Received: by 2002:a05:620a:258f:b0:8c5:3892:a554 with SMTP id af79cd13be357-8cb408477a0mr171810085a.3.1770980114364;
        Fri, 13 Feb 2026 02:55:14 -0800 (PST)
X-Received: by 2002:a05:620a:258f:b0:8c5:3892:a554 with SMTP id af79cd13be357-8cb408477a0mr171808185a.3.1770980113926;
        Fri, 13 Feb 2026 02:55:13 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6e95004dsm247492166b.5.2026.02.13.02.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 02:55:13 -0800 (PST)
Message-ID: <367a41a9-8e80-4bcd-9985-242469024b31@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 11:55:10 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hwmon: Add Qualcomm PMIC BCL hardware monitor driver
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
 <20260206-qcom-bcl-hwmon-v1-2-7b426f0b77a1@oss.qualcomm.com>
 <7911bbae-c507-4420-a05c-89242941f774@oss.qualcomm.com>
 <66e6696d-3fab-4da5-ab89-4067d856f186@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <66e6696d-3fab-4da5-ab89-4067d856f186@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: U9BJ2gTbM1gq2CoD16TchMacGKG4aTwZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA4MyBTYWx0ZWRfX49Mt0k3WfMVy
 ukAHzOIDOxI0jFpvnYWxOg4rC8P1p1GLc2D3SwchDmf1sVCztrUF8VfUl4kcK2gIloOwi0mpJ0m
 QIFyEt1mscA/tUXBFSEh0yY5k1rEJAzsfsCeuhDlKK1bvdCrBhFF+pGdq9QZw28zVd0PvIf0aB6
 fXpO2yd9qBu74lpCr279AGps2rx9YEZNb4rJqynuGL87Nw2tCkeDSO53qE9rqYv7ooQFy30Glbt
 DN/PyCSBZ/qGDIl5BZkuVEhBLYq8+Q8BOP+dcUVsFHm4ccunLD+5gNZd72YLvuUFtDobl6A6m91
 a7oKPyW575GDdmYto4x8vT1ewmwR3jIp2qudlxopZIgnKkQD2SmGIMiSU9mtsBUT/Iwomrjagt7
 0lAEgBFzfaKYDiKgCJcAEBPcMwRUBi9HvB+duh4EuoV7XYba/cQokg1lFDq58TiMr18OnNpNg5W
 IykDMQfUVYHtkfJDMOw==
X-Authority-Analysis: v=2.4 cv=If+KmGqa c=1 sm=1 tr=0 ts=698f0312 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=0IPvm9oXmU5doNSm3s4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: U9BJ2gTbM1gq2CoD16TchMacGKG4aTwZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_01,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130083

On 2/13/26 10:42 AM, Manaf Meethalavalappu Pallikunhi wrote:
> Hi Konrad,
> 
> 
> On 2/6/2026 2:57 PM, Konrad Dybcio wrote:
>> On 2/5/26 10:14 PM, Manaf Meethalavalappu Pallikunhi wrote:
>>> Add support for Qualcomm PMIC Battery Current Limiting (BCL) hardware
>>> monitor driver. The BCL peripheral is present in Qualcomm PMICs and
>>> provides real-time monitoring and protection against battery
>>> overcurrent and under voltage conditions.
>>>
>>> The driver monitors:
>>> - Battery voltage with configurable low voltage thresholds
>>> - Battery current with configurable high current thresholds
>>> - Two limit alarm interrupts (max/min, critical)
>>>
>>> The driver integrates with the Linux hwmon subsystem and provides
>>> standard hwmon attributes for monitoring battery conditions.
>>>
>>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>>> ---

[...]

>>> +                    enum bcl_channel_type type, u8 field_width)
>>> +{
>>> +    u32 def_scale = desc->channel[type].default_scale_nu;
>>> +    u32 lsb_weight = field_width > 8 ? 1 : 1 << field_width;
>>> +    u32 scaling_factor = def_scale * lsb_weight;
>> Would this be equivalent?
>>
>> if (field_width > 8)
>>     def_scale <<= field_width;

Actually reading it again, that'd be "if (field_width *<=* 8)"

and the div_s64 could become a mult_frac() if you take care of the types

I would then read that as "some PMICs have a higher resolution ADC
but with the same range" - would that be right?

Konrad
