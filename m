Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED3C433BAB
	for <linux-hwmon@vger.kernel.org>; Tue,  7 Jul 2026 21:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783460100; cv=none; b=qRLvoJle3LtJp87Z+5EZRkKU0LdrAUJ5niBdE3OFAb0HoZst4RcZR0E1T19FQ2zazVqNmxmLcQmGnMNdDktjlir5Z5nzSRNAwpTv4HkB7iZCm4d5BJPi3UApx3XSbvY57tNqo0L4T+gNswWrcVwETRJDTgmc55aD83IkRVWaY1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783460100; c=relaxed/simple;
	bh=ZjKh1oN1nGmR5ugA3OXeqssjH570ZxG4FL0M11pzOow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tSquvX5c/GLUahZ3n7QImCWiY9MlHUXzCcvpfD+SMXbsTVpMSOutjKuEQlPTSx7SS/tzK9jYYA5xrhcnNIIZ+UkkAGpd0PgZ0ScXUdfEUu6fNC3hWubn8mZzGRZLwaYtgsvhqojoKYllL1DnV5BsYHAprZ3UMM9pYlLLF4+/7zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AbAM1hxs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AWyoi6Mq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AbAM1hxs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AWyoi6Mq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J67xq510992
	for <linux-hwmon@vger.kernel.org>; Tue, 7 Jul 2026 21:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HoPpeySyBGCXr8qgcL/4WFOt35OT+ffPSIy8GS4Q7Yo=; b=AbAM1hxs4rCOkvU1
	9BLdK28B+hNJcVE5CAe/9kU0Rno0WakVZxuF/pgVfFB89+WU/YaGcD+2QPjXWD8B
	A0c6BVUc+qGdxyjfaae4CCa7ZEK77FpTLPAT3NzQVmysBBrGLahKFasdWsqn0QPW
	vdXTDhbd9WgCClayznnm5Hg0W/jJc51GdMFa1s5Jslk7GMLgy0v9/Nx6i5rchrIX
	hZNrW6Lyzzll/x5RRA0JTIWxZnfU3VKP3qZgxuycbUmQn14kvZj+arR/5OsGY1QQ
	Ya+dYnCj6amnrg9FYpqILyKDHS4Bthho4lvPlVaO947gbPC0w0kQmy0wuyLgYPAU
	4rEESQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8wep3e89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 07 Jul 2026 21:34:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8dc607c8a54so1033276d6.2
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Jul 2026 14:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783460096; x=1784064896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HoPpeySyBGCXr8qgcL/4WFOt35OT+ffPSIy8GS4Q7Yo=;
        b=AWyoi6Mq6oyWVorrYKqE9qRTxWuC52BJYfXHk45o3ulL7cylJGy3paaeJEoItiAwcu
         5XxmX8UajK4SRMftVTP2dAQoq9zwi0iHrr7GCG1zuNilfjAp5/V8mnve4AQKnO+F6MgV
         edzwvL8nlNWycMlu5pixLBm8lxE5AXqgeJ3xpMV/fBzt8XSr9m8+3t9Bf+lHOwwKG+4J
         MlRapTjUL2su25QK5hZpKRUdgQYT+FtzqIbZHVbBdgPFHguZF35OnpYkT1yXI+x8J055
         EAeMF+iLsbkRN2RGczjFAJgBRFl6Lr9bJx01W90Z0/7HthCwZ0sT87nP8xv/318zUkXx
         Et9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783460096; x=1784064896;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HoPpeySyBGCXr8qgcL/4WFOt35OT+ffPSIy8GS4Q7Yo=;
        b=Lu1dKfuJSkwe0XAJy1eHItSQrMb/yrHpnDw0Tu+hQirZAxQXUvcCBANKcI/Pgkk2FT
         JGvqsJvmTWHuB1gmJKyHOE2qgXdTs/05s9jQgRbeH8yT5rt8uLQM0GYsS6OFqBxbceWs
         MrqHngZqTLrua6Sw7/OhXUAmO4ZSbtXyn72d+5/MfOC3C0Mqdxna/U7nuJOb3i6Jotz4
         BmYzqZbVEt7Bb8P9zn1wwEHm5YZnMW0udoyx7DrzypzbRVclsZDyGvv34ue5eQ+3bmfj
         Y2Wrvw0b3YFQPqfqItSW8L28PVEjtcRdv61InAoXPvJvk+lkixDt+9gFG2kQZH5w+PHJ
         8oAQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq2z/jkNCn6VK26KBmvVlvmbmZ5qisEqwT3bfI1Ep/vTfVprb5+k/LnKJCvkMF+Gh6EWKIWfu03b3igNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxD3R4DCkzIkuRE3SxJ2031o3VpkKhkLovYisPd5gzo7g9bh3Kf
	yQ7w7GArRPTlDjGnM4yHE4Q7Capk+xnGAv7PvGbXEEMiS2aUv0kZwqaRHvI587S0isy1o3i106h
	bi4zllh33Gv1R8bHdUVxbeTNB/cVLd+RscVcXwo6nu09Ps2y+M0ltTRPU4xxXldjhxA==
X-Gm-Gg: AfdE7clnSAakMJGpqbGJaytlcoPT8846cmas6jAP++AkR9NvRUuTO5N0An+AgFT99+V
	boMn0o+IiNjg0DmNZBavIL2QFNj1JMjqxUH56eRdNPuWtrsufWwTrBwZy0mV8SXsXoqo2mMBXYN
	O944ZrPjxMGeuUn11xbG6+1SNZdfSCok2M/84denbyDhrXhzONNxKmMhBi8Xl6MmiekBmUuCzbr
	iqPqqrOAP6TTV7EEwX+BjcPolAQpzzKSITADVGAWuvlU/hri47HoWfTMIEoxy6/WqJ1gMmazQpy
	vNBSmYXdRZzej2JzvkKrVxTOEeNzr4e7+LRDZPMuUaI/TOk50yvd4ihzKkaRwupmdMWt49qdXBm
	hwnd/2KdJBQDdRLJgAcLHC1U5AiM2qcG2mV0ECH7BbfVXt21MKZ19CMovjhub+S4jhp2oRTdQ6A
	==
X-Received: by 2002:ac8:5a91:0:b0:51c:404:af7a with SMTP id d75a77b69052e-51c747ecbf0mr77057261cf.31.1783460096132;
        Tue, 07 Jul 2026 14:34:56 -0700 (PDT)
X-Received: by 2002:ac8:5a91:0:b0:51c:404:af7a with SMTP id d75a77b69052e-51c747ecbf0mr77056751cf.31.1783460095274;
        Tue, 07 Jul 2026 14:34:55 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:9094:f7db:443e:b97f? ([2a05:6e02:1041:c10:9094:f7db:443e:b97f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d843csm36002250f8f.14.2026.07.07.14.34.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 14:34:54 -0700 (PDT)
Message-ID: <22c4909c-9d2e-4b49-bca2-f218e701138c@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 23:34:53 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: embedded-controller: Add Lenovo
 ThinkPad T14s thermal sensor provider support
To: robh@kernel.org, conor+dt@kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
 <20260707192228.14647-2-daniel.lezcano@oss.qualcomm.com>
 <20260707193005.3CEA11F000E9@smtp.kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260707193005.3CEA11F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: B-t4q2jbr9ZTdoAC0iNGVovvSi0Io8ji
X-Proofpoint-ORIG-GUID: B-t4q2jbr9ZTdoAC0iNGVovvSi0Io8ji
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIxMSBTYWx0ZWRfX2UgOlIqU1SEb
 UzUn/NH+dSSSbMo+JmZPj2SNIRC/qVBx7X4oo3xxfnKYZu3V4qEnPuQjj/LpvcA0M/SmS7eGqbq
 Ezi/1SVH0D7nxiv5g1NzNCBxdGq7ap2iQcubZmrwpbXaocFjVK5/Fp+lhDkIyxrtQmE9jByeG3N
 eC7Hh/cp6xAH6FRn1schSH+Yf8GBu1SMSs5jI4FzavqLAs1XVrVDFSmeCdPXq3nP+3zbcun4b1J
 uxuMf6ocA9ziehti5ZOpzPwkSs9Wsff597yPLXIGAe4BdonkXl73GTJTRwrQ40iJ/t0oTEJD1tR
 h4RMCCetIxdtVb+dVo/wJCS3rvwBl3VYqxtuK1yL1wVl7C8QErn7KDddn7LI2wPpGRS8GlTf8yJ
 w9B5QqGCyr9qXrpk0FgtRURhIQ0iYgICZGgvpbJK5yUAKqPhWhaWQMdX2IL67HgEvLSFRLkCJEu
 vPeIni+kHGAcP15PRNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIxMSBTYWx0ZWRfXyYHedmfBoeUu
 TtWykG0CfRKGgDebBReEpb3mYxxi3iiiMqHEYNGQLvqIE1MN/i92yxUhWfPr3169PSUTHbrHqZc
 ckZ+uExeO1JbIUwEXthx9B15ThWJn0g=
X-Authority-Analysis: v=2.4 cv=atSCzyZV c=1 sm=1 tr=0 ts=6a4d7101 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oF4XxwQXYdrVB_WkrCkA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070211

On 7/7/26 21:30, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The newly added '#thermal-sensor-cells' property is missing from the 'required' list.
> --
> 
> --- Patch [1]: [PATCH v6 1/3] dt-bindings: embedded-controller: Add Lenovo ThinkPad T14s thermal sensor provider support ---
> commit 48ae118884c307667e25a720a62e87b8e32443c5
> Author: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> 
> dt-bindings: embedded-controller: Add Lenovo ThinkPad T14s thermal sensor provider support
> 
> This commit documents the Lenovo ThinkPad T14s Embedded Controller as a
> thermal sensor provider by adding the #thermal-sensor-cells property. This
> allows the EC temperature sensors to be referenced from thermal zones.
> 
>> diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
>> --- a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
>> +++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
>> @@ -26,6 +26,9 @@ properties:
>>   
>>     wakeup-source: true
>>   
>> +  "#thermal-sensor-cells":
>> +    const: 1
>> +
>>   required:
>>     - compatible
>>     - reg
> 
> [Severity: Medium]
> Should #thermal-sensor-cells be added to this required list?
> 
> When hardware gains new provider capabilities, omitting the corresponding
> standard properties from the required list allows incomplete device tree
> nodes to pass schema validation. Dependent thermal zones could fail at
> runtime if they attempt to reference the embedded controller and the property
> is missing.
> 
> [ ... ]


If I'm not wrong it is a false positive

