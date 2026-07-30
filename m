Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CEB39C00E
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 15:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785424810; cv=none; b=nqwLQcpN5WtmzfOHA+kRi5p7giC5tk+O97JHbjVGquL0HYBRAduPHb0AAvGjD7pRdK/70ys8Gl2TR1Tcp5eXtZS8tBXB5TynJxmaOhLWWLYKs5ypLFm65g1XIERYTmPVMKKlS5Q/eOrDSIu4IYOCwv460X0eU/jeDdyLY9moJSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785424810; c=relaxed/simple;
	bh=4UwuheMNuKFG5cXp/o7N0kc1T5pw59f1tSxPt6f2HVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UMSLOcRXg6mkrqbRa6eo6uhS3fGYIw+0LCsJo1Q2SsfmfheWHWC5bcFqZR2BdCiXXBKufJkFfVOGgoAGwy0Gt0SlYj+Izjkaa076FnNdbzVjwuFTOWyLZkVjf5ntKAo7aiUNmSAiuPITVAnxtCxdzrfl57MnBZH1n0NHB04C4Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D4AGZnhk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Avk5eB6U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D4AGZnhk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Avk5eB6U"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEhAe41385038
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 15:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z2e2OCzan7EyEJ0ZEQwZXLj9oRLJAD1e6T4kgplKI8o=; b=D4AGZnhkRuV937e8
	Sb5c0n1TQJLhHUL+5zp/vxVU9dxraxT3vlDWWO23GPQtxIl12NuPU62+B0DaDfhD
	Y8ofbflqZWuypKS5mk7mkDDUHuWEXLi4uu761ivHQoPdSpWghKteoy4zClveVA/T
	xMSjKnOGzH5o2jVibCwKKKTD+F8AR12OsFe0jOMH2nwS+kcYNogQOGcPkDxb2GnW
	jUvdL8gZ2LypRuih8M9cWccMbk712yCa9XmScaKk6LqojPMaEPJePZ/moTNo4/zo
	AUjj01X9mnIDlbr7kccEHtfg7xOtNFCLPyhUB2TZf233nbGIOyM6ODzUFo4BLidh
	sBHWjQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8md06mn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 15:20:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-933023a5980so359471485a.3
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 08:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785424807; x=1786029607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z2e2OCzan7EyEJ0ZEQwZXLj9oRLJAD1e6T4kgplKI8o=;
        b=Avk5eB6UL7DQ+fmr5IHu4g71et8E13rXR2/9p6FyHhS0NXUKamFpxVaDCrqGrnY73V
         kHifwZmiIRvdHhzJfHVrNaeMUZE/NdEjQ/EJkQbWkK4Z3nOleywCfA4k41NKYLeP+TcW
         3NZt+HN8+Pslmj+b4TDMOPaLSnjgozOE3Unc0Rshp2B54PkcWDADMg9Tlg1kbLQ3ea5a
         sO8QQ4KyXBegrMJnUvMUbtLVc5Zf+9JoY5lnUgxZjGwbfiynBz+R8EYn2Pwl/jO8fHmz
         kI5RUhvZbldjnKO6XB4lKBS5+bGP+3cXgdCI9SuzMrOq3ClC2RUVz+EVPJKDhl6yGZ2M
         lsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424807; x=1786029607;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z2e2OCzan7EyEJ0ZEQwZXLj9oRLJAD1e6T4kgplKI8o=;
        b=XfKVd3vbwIhZWDD3OG4CM/qB3eOYX1n7nntudGyqXtcMmCo/KR2S2rYC1iosQNliBo
         VtAWAViLm5aDTli9doyMRkcjncPxFdHzb7TFvmiMdC2U35nU4L5g37cdP+/P4xAiKDhf
         ytDWF/SJ2M8soDMOV8hTOjM3tcPYJe1Nxp48zdo0IcRr+kNhS6aID+rUKXcF9ZYQYD2v
         Ha/mYxVc36Nu9G+CEsK56VZfBVffzKKltliUZm32XtPKrq1DH9fS7j77cNwvZ0/2kVBs
         nuIknBfCDSqzgFJc/zij8Ss/t5yv1KEGqMHMisqXJsn+2BR69UGDi1OSxcMvcpmkWOYj
         iQ4A==
X-Forwarded-Encrypted: i=1; AHgh+RpZX7V6+EMbEKcFFOJQeoHhdtTXyvd/Ak0LoqUdIOPysv6zMa/VMAUJbwMkQKSza5l/cjHKm9oVtUdx8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBiMQmM6hZHi1XchYZ6Mg7sFJ327R/aOEo+viIFBho/85GmJC9
	yExuUSzcTf8yex28lFIs2XgLcKhLhSH6Y4wc3Yei74IsZHxKV3F1XA+CQkzPHgzk5oi1ymeeh+7
	ytmJ7xjvt7bvQc4VafwXXl4+mWlWeY2CUqn3GJfVldi7U3307mqOgMyRTdGe3n2LL6g==
X-Gm-Gg: AR+sD10eM3WcfiT4vZZRK6sCjLc1olkXjj8U4/YzscOka9Ek2z4/LRDwF2Saelb/rNz
	DPEI+CeryDl3H6feOvM4loYHfGPFZ+ztL8x/nrQGCS/L5U1qaqVgcw93f81cp2GtA5gGGkmqBLD
	DP6HF/k/UtB33JF0QJ7Z/baiRBmDRNQyjlMTYlnhkLPc8QXSF7d377zH+KzAigx8lcPYaymCBez
	RCKYmcy0FGPI4h1d5RBw9ou3A7Butfxm0aeJRf6WoCnZDvoUXDpE3fUpyCptiMwq/V7AxG1rigH
	ZQ3Dp2Gm5aR3hWPyKxlk5PMr2w7N0KrLQoKt1TYUkPCQrQBvsk0U33LCQtvocyBlviuQ6MyQWUP
	rkx6F7k46nnvlRDie6pB20j4p9pIfznG8clteVKZ65A==
X-Received: by 2002:a05:620a:a183:20b0:92e:c118:18b1 with SMTP id af79cd13be357-93486f080b7mr230422485a.80.1785424806975;
        Thu, 30 Jul 2026 08:20:06 -0700 (PDT)
X-Received: by 2002:a05:620a:a183:20b0:92e:c118:18b1 with SMTP id af79cd13be357-93486f080b7mr230418285a.80.1785424806397;
        Thu, 30 Jul 2026 08:20:06 -0700 (PDT)
Received: from [10.44.237.143] ([157.51.226.244])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933d3225b17sm431211785a.8.2026.07.30.08.19.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 08:20:05 -0700 (PDT)
Message-ID: <fdf4e885-8f36-432f-9247-80f216ba353e@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 20:49:57 +0530
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] dt-bindings: hwmon: Describe Qualcomm BCL
 hardware
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-1-febe2805e17b@oss.qualcomm.com>
 <20260723-radiant-scorpion-of-hurricane-cbed57@quoll>
 <63b4c911-d1a4-42b0-a66f-b0c84308d5dc@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <63b4c911-d1a4-42b0-a66f-b0c84308d5dc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UZphjqSN c=1 sm=1 tr=0 ts=6a6b6ba7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=cCWIhcq3vK99OmWhR8wnPg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VXrKn6nlqrV7Eejcd_EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: sU35tm7UEjp9JRIIs_Pnqc5cBSjsSMnX
X-Proofpoint-GUID: sU35tm7UEjp9JRIIs_Pnqc5cBSjsSMnX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfX2hckehuyfmBH
 OHu6mdZpMf90o2O7vWjKyhtqG92VWwrl5YXyKoCT7E5M32oGc+8jT46kcn29a+2yotRXnUkcTAa
 piehrEk6an3Vb+OOQCyE4A9KB26a2qk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfXwjMsW8F01wLz
 6JxdSACPypCbE5sFM8MBTUmB/KIXCZrxwIJij8W5uinGS0ULw7t3VtfQLLtiGUfFVzj08hKkjxC
 0lIz3mP30FMByyLHvDnZs0byckM5qeE8RWKMaFYx6KhCQkpEOekjmi+qro8tLp0KAFx3sn+SWis
 fUcsF20jVV3auxOqPo3Nv3LRJu3KhXB2kpnf9eewv3slzoQSp4IKRHPXzbEjFoG2cRZxIQi0JtI
 wyUFr2kigAosFfEYdg/aJbjL+DPbhLmxIyengxpFVIubNBZVS+ooapmT0XWKLjDSrVAE6c1y4eK
 GXpvCfGyoVpTKLrCG+aUaDlR1cSNFN0KcqjrnAJ6D3a03eFW51mwoUlJcbnjSHiTKbf8tgwtV6a
 fTYDhBHcQEVczONlLK+kDftV3XWSXYM8rchWUgFeD8zvFxmsD18hlpcgiZ0ojBctl9/fgW4ukmD
 uOxTLJh/relS14AgaRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300116

Hi Daniel,

On 7/30/2026 5:05 PM, Daniel Lezcano wrote:
> 
> Hi Krzystof,
> 
> 
> On 7/23/26 10:11, Krzysztof Kozlowski wrote:
>> On Wed, Jul 22, 2026 at 12:00:06AM +0530, Manaf Meethalavalappu 
>> Pallikunhi wrote:
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - qcom,pm7250b-bcl
>>> +      - qcom,pm8350c-bcl
>>> +      - qcom,pm8550-bcl
>>> +      - qcom,pmh0101-bcl
>>> +      - qcom,pmih0108-bcl
>>> +      - qcom,smb2360-bcl
>>> +      - qcom,smb2370-bcl
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    maxItems: 2
>>> +
>>> +  interrupt-names:
>>> +    items:
>>> +      - const: max-min
>>> +      - const: critical
>>> +
>>
>> Binding looks in general ok, but feels incomplete. If this is battery
>> limiting hardware, does it actually need any battery data through
>> monitored-battery property?
> 
> I'm not sure it is relevant here. The BCL is not a power supply neither 
> a charger. It monitors a power supply output which can be a battery or 
> another source of power AFAIU.
> 
> The monitored-battery property is used by chargers or fuel gauges if I 
> refer to the documentation.
> 
> The BCL monitors the output of the power supply while the chargers 
> monitors the input for the battery.
> 
> Manaf, does it sound correct ?

Yes, that is correct. BCL monitors the current drawn by the system from 
the battery, as well as low VBAT or low VPH conditions. It is not 
involved in monitoring the charging path. PMICs such as PM8350C, PM8550, 
and PMH0101 do not even have charger or fuel-gauge peripherals where BCL 
is still supported to monitor low VPH condition.

Thanks,
Manaf

