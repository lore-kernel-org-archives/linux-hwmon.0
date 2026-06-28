Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4730F2D94B0
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Jun 2026 17:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782667868; cv=none; b=RvXheSeHOSHkozZ6KZiRgpqRr7hPA1A9gSKjPhevw7/NUneW4BCeaJaXJmMoQmCVlbxHh9zHlDUlsb1U7jLwrDlzcLMdFXvp9EhIq7ymebzFyQqsDEmkSKAUFgdv+xOM8fpSlgYmnebyKz5RSBWsZF2tpStxOmRSHfJgUjmZRFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782667868; c=relaxed/simple;
	bh=ZT4Oi48MQ2edPaWjW8khM1ET81+4j1v2TQ4M0MI6hX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nytEzB/PwV8KMeWnGFWgaAyDw0Ye9aR/vfHltnocmOwUXNNgPBOSW/uKDw2coS4vHHJSgOZ26oCCLMkd+QBnBC2QlIpu9rNn7dZZIBqlyi3eFX0i9IazXJuoXMLyMdjdDhBHhRc6hqV1NcULjgyzyOzVQK+nMsQ4xJzqBzgjVmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NzVjkylx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SIcOwEyw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NzVjkylx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SIcOwEyw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SES7Un018480
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Jun 2026 17:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/LYGGwI5goWOdRY7GIiaFjBfkoZM/HlIDwQhWdcH2Ro=; b=NzVjkylxUjSWlaA4
	g03Tq7LAV2Yhm3AjQYZWm/oEjfM1/OvIFu7/0RbkV+K5MY8GVoELRGPrnkxclIFV
	cTuuQVXx1t2jrD+DSSPff1jpUChZyG+DsaZ5+XgeYObuDVxXLJyGa4ou7oUNM09X
	3N9r/nuPYEw/Piu7NUaakINNB0pvBtBdIir9P7MebKCZhIeF1oedKH5ljMsH8L9X
	YqozeKwYCVBe6J/4YeWiyVkFPms85ZVLFikjExrXM0Edsg1RLGiWOKRAXbs3GMcD
	WZ8/IZe7BlVyKBLaCSkiRc/w4zwqs2QJPCXsAYeNDdBJZ/rIBJx3kDxpEGfRoYU2
	5RAvvg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27333bdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Jun 2026 17:31:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e538afe65so4906085a.3
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Jun 2026 10:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782667865; x=1783272665; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/LYGGwI5goWOdRY7GIiaFjBfkoZM/HlIDwQhWdcH2Ro=;
        b=SIcOwEywy1Te/GgqNXn6bHF5kw7QSqMqSoaILKbi0lcEX8QyKKCnPz7ShpktRsS8+b
         uj5JtMyj4PkFxCbIltPetDmkUmjeGcAUrdyAglSIKSywPNrToDGwUvvw5dzrPwMgZvHv
         zC4lcPau41OcpaTiq5TaruzPU/bUjbw9646obGhyuQaLGs5ieKl/s3MqIgPBtqOCEWgs
         Cem6X5yA+XTgEPocjUaIZ7dVkE16VbcjPby2YauRBuR3dz3a3Jlv/cjgepoLhg6CUBmX
         SKpmU0Hoh4p6HwffMdTNFCnZZWp7EQRKyB6kjJFg0rU5WlCADxt7XwItKr/yuJGVlr3P
         n9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782667865; x=1783272665;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/LYGGwI5goWOdRY7GIiaFjBfkoZM/HlIDwQhWdcH2Ro=;
        b=Ch2XIwBlRmZaGgx8iuNlFOCFnchEQbHDSunuFoWShv0BFcm0RDglhV/ipA3OrCIBaP
         LiNdelwfxmCzDJ3RvQ86DPMP5E5W0bZI1g7lVN0EQTNhdQkkKznVfnVGXWxKWe96HhBN
         R1CYN8jFWmOLU1IRJhVWKPouHnV7GIh3dYcZZTJw/dpYojW5YPRZBGKRDJINDUs+RsBA
         izXVaxnej1C7Pab+7/+S7lDNG4jU7n4LYKUYFrLMSwjVL169Q+3EtvIbqLDjCzlYN5ur
         UFTK7T7nGSusLxGH8AhZrwT7RFSyvMssGGUGcsWtvk7n06WFKOjfQ80wnoDyCJFGNIsU
         5RIw==
X-Forwarded-Encrypted: i=1; AFNElJ9CoyFvBHMyoI8lgOrTkeG2H42BMAtKQQimvGqNAXrMhYaP0G937L0+eiFxs5cKorHutS65uMuGKQhHKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFn7+EjtXJp4U1/6neXsykG24KPQ7R9Xs1NHIquRdeMyh8fvVd
	MElxCqFod8+uW7sDuEl+wbd9lq/kYsYrN17UaBVmbAsyyRAvDG/8sKdInfNThp5bbZyHsnmAzD5
	XNkv0zrV+o/zYS3vmrhyjpx4L5lM7Ly9l68j8Xo9ivQMD/b70zqPV6EaQ58dMUeZEJz27syGFG0
	v/
X-Gm-Gg: AfdE7cmsXviBXml7FrlPwWb9AZ2o66cfvszMxVz8qfFbwgmTsgXPknkA+dOk0q52RE+
	EFC/8Mi7FIxTzsXLffdAx65O3mr3jn48qiisuqqskSjpXWZaIOal8qPlakTTI27oZyLI4MgRkmy
	Og9kJzHr1nFgqSnvGr6iNqMVHdGQvq+akH8SGHbRODMQ0Je0kovd09ShFwyE/RzIhVPysJX7J4/
	MiU93yzfS76NfZP0f+qLrHFs7TmkCpZjVbhyPzrbkr7YOj6CsDHwc+5TsUvFMu27QVyv50iLgDa
	rrLUnSzM+9vJ6aX2Dd+6SSljNU2vhC4OgC9iEJWw0maNH4+J3WExmQBEEY3ED/wEftPf9buYciN
	T8yDDgsuu3pnviud97oZtCMDXYp5fxhKT8fCzjV/s8eHr/WyC1nVpA0WLHhZbQKebrfOboq8=
X-Received: by 2002:a05:620a:4808:b0:915:7e22:6f1f with SMTP id af79cd13be357-9293a8a8bd6mr2058532885a.22.1782667864517;
        Sun, 28 Jun 2026 10:31:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4808:b0:915:7e22:6f1f with SMTP id af79cd13be357-9293a8a8bd6mr2058528285a.22.1782667863990;
        Sun, 28 Jun 2026 10:31:03 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:670:107a:d931:c86f? ([2a05:6e02:1041:c10:670:107a:d931:c86f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4932f100e4asm144355955e9.1.2026.06.28.10.31.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 10:31:03 -0700 (PDT)
Message-ID: <8e7a604a-4cd2-40ec-b1a1-ae5ac68c4189@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 19:31:02 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] drivers/platform: lenovo-t14s-ec: Add hwmon
 support for temperatures and fan speed
To: Sebastian Reichel <sre@kernel.org>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux@roeck-us.net,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, bryan.odonoghue@linaro.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
 <20260624210825.264454-2-daniel.lezcano@oss.qualcomm.com>
 <akEj6XEByCOkuJaY@venus>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <akEj6XEByCOkuJaY@venus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F+FnsKhN c=1 sm=1 tr=0 ts=6a415a59 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=bjHr9k4kyxrlvEBRdikA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: maQhGbANC51UoVl6tY7IA5VY1k6FfEPg
X-Proofpoint-ORIG-GUID: maQhGbANC51UoVl6tY7IA5VY1k6FfEPg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE1NiBTYWx0ZWRfX+dWe3K5qEFzu
 glS1rxRxUSL8bSIywPGhU+o9tCHE/gcNz9i/Lo9RlKWMv0I41URpQ7Xu+MoqaTRyNZNBSe6AdDy
 5fDkMbo+zsxklpP7fTIa/EK8oXfDFMNj9MQZqwkT7mwksV8Z3qlWf2BkxWD72ghAKoCIbJAUo5+
 o8GADcq6z5ijWeWlR1oZeKNT3BOVnL/S4sEgCQwxpqcE2zMRNgsxGDm9c+YH9b4ffS7sbLc6wqo
 kpsQ0H0j+lZ7Y4gED0FAxjc1nRM4NDADXHMTPuSZrozcu52qDa/YVXV763z68A5Zf87pnc3XnbT
 0qSLGyVuQwyDSgS/GDzpnL5n24lYlvUGj9tPYqKdSbc/d5ZbNxXksDB6mMjb/gPb2KM/00RRmUO
 svpu8wZ4sqgIWK3RSTd+9HSxG3sIIJwpIPdCxwsB+WzKJM5XGTX0WQWoDM5NLiDHf54Cgi37Ljg
 QmPiHr2Fcawd5r42yyw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDE1NiBTYWx0ZWRfX6ohJpJypeVeN
 PmyROeu/d/OHALlmgUM6GopOJREo0qnIxp196p3APVsj0hJpaBdvLGHlPRnVS0h695HSuAeQ3Me
 IKx3aHpeVe9Sjpmjj4zBjvQcnKbqeG0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280156

On 6/28/26 15:50, Sebastian Reichel wrote:
> Hi,
> 
> On Wed, Jun 24, 2026 at 11:08:23PM +0200, Daniel Lezcano wrote:
>> Expose the Lenovo ThinkPad T14s EC environmental sensors through
>> the hwmon subsystem.
>>
>> The driver now registers a hwmon device providing access to six EC
>> temperature sensors corresponding to the SoC, keyboard area, base
>> cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
>> are exported to allow user space to identify each measurement.
>>
>> Additionally, expose the system fan speed by reading the fan RPM
>> registers from the embedded controller.
>>
>> This allows standard monitoring tools such as lm-sensors to report
>> platform temperatures and fan speed.
>>
>> Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
>> ---
> 
> I gave this a try and for me the fan data is always 65535 (i.e. -1):
> 
> $ cat /sys/class/hwmon/hwmon66/{name,fan1_input}
> t14s_ec
> 65535

Strange, I have:

fan speed=0, temp=40000
fan speed=0, temp=41000
fan speed=0, temp=41000
fan speed=0, temp=43000
fan speed=0, temp=43000
fan speed=0, temp=44000
fan speed=0, temp=44000
fan speed=0, temp=45000
fan speed=0, temp=46000
fan speed=0, temp=46000
fan speed=65535, temp=48000
           ^^^
fan speed=1903, temp=48000
fan speed=2345, temp=49000
fan speed=2367, temp=49000
fan speed=2417, temp=50000
fan speed=2431, temp=50000
fan speed=2430, temp=51000
fan speed=2441, temp=51000
fan speed=2450, temp=52000
fan speed=2457, temp=52000
fan speed=2458, temp=53000
fan speed=2458, temp=53000
fan speed=2458, temp=54000
fan speed=2460, temp=54000
fan speed=2572, temp=55000
fan speed=2788, temp=55000
fan speed=3009, temp=55000
fan speed=3229, temp=56000
fan speed=3424, temp=56000
fan speed=3610, temp=56000
fan speed=3631, temp=56000
fan speed=3597, temp=56000
fan speed=3594, temp=56000
fan speed=3592, temp=56000
fan speed=3592, temp=56000
fan speed=3588, temp=56000
fan speed=3588, temp=56000
fan speed=3594, temp=56000
fan speed=3594, temp=56000
fan speed=3597, temp=56000
fan speed=3597, temp=56000
fan speed=3594, temp=56000
fan speed=3597, temp=55000
fan speed=3594, temp=55000
fan speed=3594, temp=55000
fan speed=3592, temp=55000
fan speed=3592, temp=54000
fan speed=3588, temp=54000
fan speed=3592, temp=53000
fan speed=3590, temp=53000
fan speed=3592, temp=52000
fan speed=3590, temp=52000
fan speed=3588, temp=52000
fan speed=3588, temp=52000


> This is with the fan running:
> 
> $ cat /sys/class/hwmon/hwmon57/{name,fan1_input}
> fan-controller
> 2564

