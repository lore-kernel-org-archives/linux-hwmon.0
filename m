Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185DB2E7378
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 08:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782723029; cv=none; b=WFZKfWOn86y7nIZtZj36h7PwVXp1bitFbyjzQz9my5UwpbnYWXqyfRnoRn6unPTGayLp0j30mrwoMMhlbvP6Twn/yJ7kPnmbo9MAt6WBmuceZmZRfUdpuQfk/4PETVEotvwhARlHDR47FX2p2c5QGES6NaJe4rcuje6u5OVEs/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782723029; c=relaxed/simple;
	bh=0OYSF/WbAtQT1B+XtvWfZQrqX3y8eIw0JK7SqfNhNOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=blpGdO/wx+IwUxaUyXeEIiuV9mcn2yFKNecv+afq//bu9s7E5uEYXN7aBNeBFZbmUodFmO+FsHGKTGZbOqXBLpxshznvYIsa57Tv/GUHKw5y4jOB7I7HSzVkMp08w2ttW1zwAPJFUA7Qqe2OJSIx9xYgvFZBqUQh+OZaAMKl8TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XrXfmgK5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NldsEXyJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XrXfmgK5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NldsEXyJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rAuB2134409
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 08:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	apEPJZgEeYzgAqQcyDRhVflzg8tLIcKoNRN+VQHe4AM=; b=XrXfmgK5olvTM+Hn
	UhfkBUXmsBpNJKDleDtco3igakuFyVPZ6kmyhCUNLOg2xC9ldOIpNEHqohvWNjOo
	J1vtMIydZZF5PRE0MGLIEtJpaB7fTJ0DbtjVdnfsh8Oty8nixh1K3RJIbvrNgehq
	IyXab9J+d58QhkbYmnjLtiZVM0eIJdsrKIGWiEHSUENVRAyED+8P+d/3DHDvBhrx
	+Ex1cA5LR0Pg0AijNrdPWSMs7LXn/CUbU4gOH6JsqUq6x+G/E+XwVOk8Wndgt5en
	34205GUOASRBHVJlCG/c5FbLBhM2aBhtQ2Y1hiGU1tkjCU4QTlvnSsMfRICW+LK6
	IDrRWQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f270a5m1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 08:50:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e538afe65so94581485a.3
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 01:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782723026; x=1783327826; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=apEPJZgEeYzgAqQcyDRhVflzg8tLIcKoNRN+VQHe4AM=;
        b=NldsEXyJcgBPb+dC+GZa3fBl0QSmXpX7MZLyh2yD4Nq8tvw/lR/f9ybtYY4upmMtVD
         4AmmEqxeXvSDjtgTr0HPpeoLwdGdQun7a/K6h+GTfhr7fhqnyzsKLPHr14YfrpGeg3eE
         Z3LMv72o/5lJTA93Pa1WECIbiotqeDkthdnJfT08HBrXDtaa9j0rGCrcEJZWphjGfX2w
         orazOX7NQ8HrWs8qAhU4B9s5o8E7vTOJ1awcCH9GewTQa8hnnnpM6xAd/pKhfq3YXZ4D
         N0TBfMEry1jqy1DMzkooOJE5PRL7UNVXmy8BfzvO82wuUEpwB0+qf7qnO9GW+cnhABpi
         lAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782723026; x=1783327826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apEPJZgEeYzgAqQcyDRhVflzg8tLIcKoNRN+VQHe4AM=;
        b=gjcIAId4oFPF739mDQENlEDLOpfhV/Zr2sMF8vB0GiF3Cmr6/+5M/5twysbg8s5Dq2
         WNhVWynMzmmp2Zp1pRi55CfVrc25mUPgBp0ZAPU1dLeEfVjdlDbzBGmbuKNT43XBx1fF
         XbF33AI+G/JFV7/PojW/X4ErV9t0rNNJoHvdpjsM4PmYkYKyDId1BpW8YZ3xXRsY7D8w
         bPvRQCII+akb41lvgVBP+uk7VwmyAvgTkyKzZMf0SZ4aaj6TFBjiQi9Wd4+BsjbtmPLm
         UI7a+uM0HLL4RGI8AkxhdqeUwso6CcNMTHFF7r4yJ1srmscRdETLnsRmuX93fgjVCLjy
         9rfQ==
X-Forwarded-Encrypted: i=1; AFNElJ+MHYRDnsBGC9h69RmRWLfZugwYV57soo0xsyhqjfDppuJxERRQUNKWMzggsEYh7KXiuaLuJfYn5YlOiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJRe034HFlq5BzH/M7miryL4M49XqYuun/OaTXah01jpV/qXIP
	bickG13GU6HYfm98nfSjhbrNgTGzVPSF/Opj7THg+UOqUDcg9n9Qb/sBpAOrfZ/TsUZ+942cuML
	VlX0q14Jz7PeLU1CY91jM/eUX38yTRZQEygLU8FqUilxYmhfKZSCvoR1c+LxJjqNWkg==
X-Gm-Gg: AfdE7ckFXuLo8uAKpZh8qkrxCQPpBxZjoa59+K87rDbOGXf1nHEG0NouhlfdxSB01N9
	C9HHCauED2C8av2nZT2fT0judPDHjX052At4UxujdKqIQKUdO52xy/qcxIquXuQymwvvNPRfFqo
	67ZOLvqaFzFK3po/fOch1S2QT8bKVG43nE+lKF236IcRwJiTiNvOnWQA5Htj3TZkOBc2orgHvDT
	D2naonjXEGdU5McoQwlr6S4k+/arpDFNdrRLqzpR1KeSvrWxNU+AhYF4rPVGpM6Oia7//nDSuA0
	0JvOfOkKG0mfxq6mwUapDjNxVF8a+JBVV6uv12EAOlqZvHyB+i4B4W3BmcoP46VA2kLfj5+RvOF
	IfS20rezmHsENtQgcNZ6wu88QpOasHt9jgmcisEeUByOBk6QDQCO9RyG7COjog4PrOsMrXhA=
X-Received: by 2002:a05:620a:404c:b0:92b:67e6:8aba with SMTP id af79cd13be357-92b67e68c9dmr1282505685a.68.1782723026303;
        Mon, 29 Jun 2026 01:50:26 -0700 (PDT)
X-Received: by 2002:a05:620a:404c:b0:92b:67e6:8aba with SMTP id af79cd13be357-92b67e68c9dmr1282502685a.68.1782723025812;
        Mon, 29 Jun 2026 01:50:25 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:670:107a:d931:c86f? ([2a05:6e02:1041:c10:670:107a:d931:c86f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493a7fd1b0fsm100251435e9.1.2026.06.29.01.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 01:50:25 -0700 (PDT)
Message-ID: <650a532a-3950-4a89-976b-76866e5d3aa3@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:50:24 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] drivers/platform: lenovo-t14s-ec: Add hwmon
 support for temperatures and fan speed
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Sebastian Reichel <sre@kernel.org>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, bryan.odonoghue@linaro.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
 <20260624210825.264454-2-daniel.lezcano@oss.qualcomm.com>
 <akEj6XEByCOkuJaY@venus> <faebd355-a9f4-4360-b123-87103ac512e8@roeck-us.net>
 <2efc0f6b-3dd6-4267-b587-88c638f02be6@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <2efc0f6b-3dd6-4267-b587-88c638f02be6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3MCBTYWx0ZWRfX4CPD+ILUhxtQ
 uX7i+oswN4iIg8F1PG9pXZ86WehXdJtgzn67NLuH2x04tpLDk1bTL5ZAqzpMbtt06HBpKNWm+DF
 z7w4dCVZxFVL9wPE5dujRyPDmfZiCqlOBodC1oBtXBF3qD6qCBW26XrlqkbGOacTM2S0mPpcKHF
 R3I0vnxIoxVCP5cVZdp3A8Gua3jJhaY9/iciNsLBtTxG0TD68h4X/O9s6YOxAvGGYqelw+2NrIa
 DaNRcoV+Dv/yNtnSu+CNobablc24SypUQli60hs65927OS01qhrXVNF8HMcSWG+lIoLqbNGG5j5
 9LiCAQ2Jf9I14nQ+5g7eOR4KLfZcGUX/W+7OOJErIqfMltJk820fdOmzvAcUwx7NVNIVxXuIFt8
 pL28aXHQ1yGujZWeUQ1YGtaBXhMpQELnm2YfBauM9suGTqIvqWz+n3bnv+DwvcQWMJf8kPAQm4f
 xKSws8Jhr9c9rjQibuQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3MCBTYWx0ZWRfX0DixXseHJGgc
 pliBlbMSZETN8wE2PPxelbir/tm9Ea/M36mPk1G7aCS/Kj6kGPscxHw5NkEmkMKo6p1KHEYPJ5k
 +ddspnmyhNsmBZOjrtlpqISYXvcp1H8=
X-Proofpoint-GUID: zSAQiZ7qO5tvm26-uQYtPp33QfiE3dLK
X-Proofpoint-ORIG-GUID: zSAQiZ7qO5tvm26-uQYtPp33QfiE3dLK
X-Authority-Analysis: v=2.4 cv=Fe4HAp+6 c=1 sm=1 tr=0 ts=6a4231d3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=CtSfB17q0sxskFCUDoEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290070

On 6/29/26 10:26, Konrad Dybcio wrote:
> On 6/28/26 4:02 PM, Guenter Roeck wrote:
>> On 6/28/26 06:50, Sebastian Reichel wrote:
>>> Hi,
>>>
>>> On Wed, Jun 24, 2026 at 11:08:23PM +0200, Daniel Lezcano wrote:
>>>> Expose the Lenovo ThinkPad T14s EC environmental sensors through
>>>> the hwmon subsystem.
>>>>
>>>> The driver now registers a hwmon device providing access to six EC
>>>> temperature sensors corresponding to the SoC, keyboard area, base
>>>> cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
>>>> are exported to allow user space to identify each measurement.
>>>>
>>>> Additionally, expose the system fan speed by reading the fan RPM
>>>> registers from the embedded controller.
>>>>
>>>> This allows standard monitoring tools such as lm-sensors to report
>>>> platform temperatures and fan speed.
>>>>
>>>> Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
>>>> ---
>>>
>>> I gave this a try and for me the fan data is always 65535 (i.e. -1):
>>>
>>> $ cat /sys/class/hwmon/hwmon66/{name,fan1_input}
>>> t14s_ec
>>> 65535
>>>
>>> This is with the fan running:
>>>
>>> $ cat /sys/class/hwmon/hwmon57/{name,fan1_input}
>>> fan-controller
>>> 2564
>>>
>>
>> Not really my concern, but those names really add zero value,
>> and I would argue that they do not "allow user space to identify
>> each measurement".
>>
>> Also, do you really have 66 hwmon devices on those systems ?
>> Seems unusual.
> 
> There's a couple dozen thermal sensors on the SoC and each one is
> registered with a thermal zone, plus a couple here and there for
> other onboard peripherals (PMICs and whatnot)

Yes, the amount of sensors on the SoC is incredibility high and when 
adding the platform sensors it is even more. Here on my laptop there are 
59 thermal zones and 68 hwmon sensors.

I agree with Guenter comment. With all these sensors, from userspace it 
is painful to find out a specific sensor without going through all 
sensors name.

While testing the changes at every reboot, the sensor number changed and 
I have to find out which one it is. It is annoying.

Would it make sense to have a per-name link pointing to the 
corresponding hwmon / thermal zone directory ?
