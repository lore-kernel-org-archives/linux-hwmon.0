Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2373D9026
	for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2026 11:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782387411; cv=none; b=qTRbF+B+TcatwTv0PYy6lD4RUO6sTE1AXu7ChGZPhtWba0zznzE5GUqoUxXk7cDybBXIhGjKf5YjXs+xFv2Vx+QpuvScbNGkiOQTlkVusq34VYi3zbMLqSVjqwSOKcyLqAOi2pGLZ+8Kt7hzFcwateEYcyNmdxbiyukm6VjlUq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782387411; c=relaxed/simple;
	bh=EKoghlk8RH2zNWov+Ldx9Bakuy2XIl3xFyMtc1/ag+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ft4clnt3FowIBFF8IbJ52H3uGwBSdRbojn/hIfLrOu5CsY7ygZLMk2jipEphb3S76tzm07wrG+YVf20GgP1RTVUdGuPpZ6MSYkXSd9bWxABtCfHRPtv3S6Rkv711hgWVP/DeA0Y6tqyAaIaJNlEChANbkE1r4Y1YpRv4zO58Euc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X2gd777n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WtpATyup; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X2gd777n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WtpATyup"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jwut1371450
	for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2026 11:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WVY/1XuYxAJzExKXdHQeGSKvfHtqz93hoztP85UA33I=; b=X2gd777n8egnysoz
	xelcUMjWxePk5DhDwNcAZk/WsoU7MGigh7XE76wS3sA9ohFY5KTFd6MACOV/mrny
	iv7u9KBsa2bl1NI/oLOhoOw0Vqp//8tlizfWLCidjcD14MhY5xG+WZcmKx37CzkO
	yqFt84dhhTY2Wt7JHNOf7VvG+9GU9DjKVGD4GZxDMKQct5Vd7NbGusMzUGY1gqNK
	2XeEXfcDqf17zhnIb6E4Lf3rcGnOy/cLftKGXq80H/iKbMiukCDyW1KJHFyjm+XC
	bSIY+sJW7htd6od9SreojJ8QKtHRj7iGCyEMsNSIWERiv+QyjhyA4Zn7bYt0+pwL
	+UppEw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ymv108u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2026 11:36:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-920eff1439cso26261985a.3
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2026 04:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782387408; x=1782992208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVY/1XuYxAJzExKXdHQeGSKvfHtqz93hoztP85UA33I=;
        b=WtpATyupeDwKW4nuq5eBTjOvmO5zFM96eME5bohugOJxnHJHYnNf2dign71pS47Lx/
         NiXU2zPcBwY2cRBh92cn3d1jXTxp/hQCwPaf0+9H2+eLRs0nVqt/a5dEDp5rp6J08c8K
         ea+LGb+B8o3bitp2xJbai08dFPsYN5pADQMpJPUPyrnq0cliYcSoYAnu2ymTYohT9+UM
         uaAT4xpyKaojUxLeVAQo5kZOs5jPVoy4Grj2kweVQihcTfdOfhtqz+4YNzGKGVuv0wUN
         D8GTDhZmqZMFtjdLaHIywAazfBVzF0nhkFk/tK/ORJaOg5+MNuXmS4C6m6Kx/VYgh8gG
         Pl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782387408; x=1782992208;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WVY/1XuYxAJzExKXdHQeGSKvfHtqz93hoztP85UA33I=;
        b=CJeYMFRRjmEd/G1qplGmVaUeEzQ0WM22qynjmOzwFsgHQcODA0d2lmf4qL9mZaX5vH
         KwHbF7bXmTn952kIpaogIgT5wjL9Xs+5ksnJuUqus952dj525P5kQf8mUZVw7JUYz+tf
         DircQYLQIwjfXYsleLTZnlf/7Gh2K17VKdPx2BoKwtzDhmBZoG3URjeV9iVdAfQMj3Gt
         2xJhTK1dR+djOzyVReZt5vbdhpMkS9+0eoW+XhZSWXl7ReDnPZKgOHhPpFRw6Q9cQIaN
         9AioxeAikn7lrZFNH228xD62z350n5xCOE896HWkmQiwOgi275S+0yCDTjhUamI3JLzo
         zdYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/3wCke7tbhCde/MGb7XlgDXAMaC/7hm1nMsS859Hn0bhC/4krBAAiJfbqhL8H/1zgpegwwJ6Tex68y+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3pX1jekYwLwMHKLtbuatk5iJCSNOMMotxmkIYJ41Xi3X5MydA
	9YA9kGDTlMrEQlALapDian9hxmXFSc64lkN7YAp1wJ38h78+wsmbpFojozI8A24J4SZFq/vkV55
	9C7VfsoGlVsxUI/eBFRk+OVBGw9n20YtaaZBRZdeNFmSAiBccatxc9R0No/DU2Rd8uA==
X-Gm-Gg: AfdE7cnhE7AOiRY30ROBuNRSBvm953YMHqQCXVYGWlqUWXKNB4/tnS3R9oYYh6sB8HU
	fc5Ew1b4KqEkmPvE5fk9yR8ik6cbWnn1MOz0myKgAf/MZmUjFpYLHFnMz7X00qd67lS2jSzT2Go
	WSj31o4lsQSx/g+d6wa8sZjOZs9ErgV2fspC0d8OLzq85Snreo6jdgL2LVYMb3j0gjVksQkhbPB
	yE1pGQPGIh8GhresBAd+m4P8d+Z9NUkcCVerU9kGc16GtoRFNSynyXCMnQO1eI7wEd0q4PP5mH6
	aCNX7BoQ3XaTXyVZeK2py1GwmbUc+MLt5GbKArU2HcOz9UoJ9d4/sWLdWP5fCwchq/LkyS0I8TR
	ClD1v0jS8q/7YMhbGLrWHPrk4dKaiIWlGrd4=
X-Received: by 2002:ac8:57c5:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-51a72a47ba5mr15818721cf.3.1782387407660;
        Thu, 25 Jun 2026 04:36:47 -0700 (PDT)
X-Received: by 2002:ac8:57c5:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-51a72a47ba5mr15818501cf.3.1782387407280;
        Thu, 25 Jun 2026 04:36:47 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbed6c78sm161489066b.60.2026.06.25.04.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 04:36:46 -0700 (PDT)
Message-ID: <ea233160-505d-496d-a321-dc23e7f69d80@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 13:36:44 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: x1e78100-t14s: Add thermal zones
 for keyboard skin and charging sensors
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, sre@kernel.org,
        hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux@roeck-us.net,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
 <20260624210825.264454-4-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260624210825.264454-4-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DqBmPm/+ c=1 sm=1 tr=0 ts=6a3d12d0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=68P_60IqByrghkTM5uUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA5OSBTYWx0ZWRfX9HfjIyPBTKeY
 UkHEGEdx1yDZT8/JxpGAS00BVF3GGa299DFPesugCvNc8JssVpoM7NVFhmE0khsdC8ga1QclRCP
 tbPksFc3CLYdr0eVGqFINWxdlPQiM8U=
X-Proofpoint-ORIG-GUID: 6OVpfqrr6LZNeh8iIakYzKct4bL5AOTh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA5OSBTYWx0ZWRfXx3Hhul7qqlS1
 WKmwN6hMQjfgh6xp19EijJZLduZwbWfHV9Hqg0oloCsl1zZYbWNshRkDh4slVqMk2eBRFMQiPfL
 A97EMEGgNm54GIG1Ki1CbmmqfF/mRsOyijUxguowWlHGX/Jwi4C0g1Hbs7H9nBHXiwVas3NHBo0
 8o5tjPPLfFWSEXp9ppSzFs+zEuElM2FYtGPTYGc+bGS1LO5//RjHcFUxc1nGA72l13xsgYGtamL
 apN/0UP2KOscC7yCYFXNSzwlieNs5jQLzuHv26u7mNnDBU0jJCi+yn1/8RCml04BozkOHs7KByZ
 zn8EbkBwTrPVNBQbIQzNajxllbNFKyyzhR26PysqBlj3YjRynyCE+PADlcPiMVNA10WAluWkhuX
 x0Ya/eWVDzXaIWRfMhSz5MHjH4ED45/MgaQ/K25VnBLKZ9R44Ri9qyiwwzW8ZrkRLBjBhdi/DQQ
 pEOF1pblkkpMNLMrbWg==
X-Proofpoint-GUID: 6OVpfqrr6LZNeh8iIakYzKct4bL5AOTh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250099

On 6/24/26 11:08 PM, Daniel Lezcano wrote:
> Add thermal zone descriptions for the keyboard skin temperature and
> battery charging circuitry sensors exposed by the embedded controller.
> 
> Expose the EC as a thermal sensor provider and define two thermal zones
> using the temperatures reported by the EC:
> 
>   - a keyboard skin temperature zone with passive and hot trip points,
>   - a charging circuitry temperature zone with multiple passive trip
>     points and CPU frequency mitigation levels.
> 
> The charging thermal zone progressively throttles the different CPU
> clusters as the charging circuitry temperature rises and triggers a hot
> condition at the highest trip point.
> 
> This provides thermal framework integration for the EC temperature
> sensors and enables platform thermal management through standard thermal
> zone definitions.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---

[...]

> +	ec-charging-thermal {
> +		polling-delay = <5000>;
> +		polling-delay-passive = <2000>;
> +
> +		thermal-sensors = <&ec 3>;
> +
> +		trips {
> +			psv0: trip-point0 {

"ec_charging_tripN", please - these labels are file-wide, so it's
better if they're not overly short

> +				temperature = <55000>;
> +				hysteresis = <0>;
> +				type = "passive";
> +			};
> +
> +			alert0: trip-point1 {
> +				temperature = <63000>;
> +				hysteresis = <0>;
> +				type = "hot";
> +			};
> +		};
> +
> +		cooling-maps {
> +			map0 {
> +				trip = <&psv0>;
> +				cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +
> +			};

Stray \n above, might also possibly want to throttle the GPU.
I don't know.

Konrad
