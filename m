Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A17F3DA5BC
	for <linux-hwmon@vger.kernel.org>; Wed,  6 May 2026 09:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778060400; cv=none; b=g4sv8r+3xDjdlQDkAhe/KYAhIS3xrxS9gvGaKEA9yiyAJMbK+CCzF4OFX1m0Fwlod+sONA6Gcd/J3amAqCPwoygfrFd9qpogtdolcqIej3/cAk2dKWF12qZWmW5KOz9y2PKbyC5nrkoJZSEFzZkcJDnKnv/ISJ/WSYZIuSdIxi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778060400; c=relaxed/simple;
	bh=c1VT32KnG6+oHZ6ONmU/UScdS6S7KFSFAVheoSBcHT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wd6Bgc1Zmx4SnwsqQvWDcjrmMxt3s1nAfrYYrCP3MKp2dCsbPSqteO5qafb4LAQpi7hjcCjVar27/a8F+zO1KiyNuj/5y/AgROp1zGGKm9BhdwML8wdiFLPPiKUNxRsQ93Ji/NY5o1KGD0PPB2Cgn+TSSau4aGt/W8rgZ3n7MgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O4TK1jtU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JYRYV/ph; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O4TK1jtU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JYRYV/ph"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6467luC7248496
	for <linux-hwmon@vger.kernel.org>; Wed, 6 May 2026 09:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w0LtpmMS7PPj6rKxxC7mQOxdS0VdJKbCRu4+5qciits=; b=O4TK1jtUMuIHCnB5
	QZN4O2cU4nOrlTxKudosxV4UnBhy1XXsZzbsULyc850LrgcSLub9AKHteRTRhw13
	JAxLJ52lidL+ukkJ30aXP7wYEaDVWkEXfPTcFx4LZVKJJ4ExCcuGxNIHN/mFU9fY
	i/wJqbhQoDokkURt7MivcrOlfxfcgezNQCoNhXURT3HuLU+RyfHvn/jbc0N+hqpj
	L2BQZAbFGqBR0SFQZTWH3hwyiYbzVs2Bm5eavkS4go/MC3Nws7Q98HvD+1yBZEoy
	WHfZfIyXpjrYt/w6wM1DkAJADDiUHblIBwm1lVbzstVaK8cKWXU2iLsysYMJNMtO
	MqaEFw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyjq43w36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 06 May 2026 09:39:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50da529ff48so143711791cf.3
        for <linux-hwmon@vger.kernel.org>; Wed, 06 May 2026 02:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778060397; x=1778665197; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w0LtpmMS7PPj6rKxxC7mQOxdS0VdJKbCRu4+5qciits=;
        b=JYRYV/phW6L8fwO/XxgTX6FwSEM6P9R2gSr4+62/g3RTLwtIDCXOI7QXD2su8YqY37
         RDqEVCEQWZHWGKV60sK3BOMy+52Rh7E6/XcARR5vJMCzVae6ymrkq/6XDJAz+6yuyMIh
         2BW3fLgOnlAXc+0NXeu1pARFopoGU8Wf8C6XKsqz5aNgiK7yXNF00K2bqHczq4ReR+3I
         SHXPOx2bLTg+8m+gBt1fpBFCwmQl5R6m4Ux4oXKxRWUxEb+fclaueqT33WY07b4o0en5
         FOYKLbIKgMWHdWD90Ar/cKQhlULWOxk2hcOVzCyC/pgwVlfSUJ+xb5RRT6RDdZUHMnmE
         SGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778060397; x=1778665197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w0LtpmMS7PPj6rKxxC7mQOxdS0VdJKbCRu4+5qciits=;
        b=s2fcAyw2rlTrNfhr0uAZWJPA20g5gFKZyUP7JFDW/htSnuBRV4CEn7oHqicxJcm7ip
         4oZWkbQSS61VB0eaDJu1ImQGOcrdWH8De8bJ6CHoC4yHrx81NBqpDIzRC7CAxTbaaD1n
         GN9SudQA4vapmGb2R4Gf+l50d6/W5Qx0GgGGoAJTjNmqTQ7Gq0Q2p7VLPcDLv9Cpo+CP
         6p5H6D4d1/WXVg1EcJHjpWGxQlAiNccZOVmFszbBUrqPZA7JWKCf9H8ZsnscTc/iTl/n
         WYPEoPBXnrq0x0qZIMG2yYb0303T8GFH1QJOxP0ozpOKJfAPC4gd5rtpFTvqniVR70WX
         LwDQ==
X-Forwarded-Encrypted: i=1; AFNElJ87OPxNHhKU8bpviz+adUkVv/qMswO2RfogbxNJerNhyUL0AxtKBZu/fRo9paNObQJOrqP7bjEimQOqLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpaidsYJdLzfcylXjoV3PPO9nwnL8pHKZ7nFi5m4cUL6MijQt2
	1BT7zhdIiqyBR6wQOxxEyM3iaBmZFWuvc4UIJFPivkOcvu4y97MLhyLHBoAiXIW/oQAjsneu42f
	t6Jw8TLfF3vGcJnN2+VFNi0Jfy3woAU7iFAROJOoD5oO7hc0u4lQU8MAt8j+finwTxQ==
X-Gm-Gg: AeBDievK0MfDQKkdSE9weJmmfuGzraIpRz9y+s1l5sJOaXnLuduF43XmvK+XmOL5IjB
	dMQNJbnXGUx9WWef1TWA4zVQYBswoaOZ5gXxMzk9GwaZQ1klU0SX1yv07fU/uu4Tyj9lNVoqbgu
	XOjxXpFlVcAX/BhQrh+kviVdZvAd3+Wx5BJ6UNWwkM3TLCyqbW9Ak37liMvSkjs6vPf3ddkUpmv
	zXOuxEuJx/3PoD57A0P5N3g66v7fuFKEwPF1FVXmd7v9Y3ZjcJtP/H0rYoP1Qo4l4N+0ONbvEyU
	oZR4gwirt/0bjNmoO7mU61uiEyUqSExufLG460nHtHtoLYJZQG3EYn28f0nVOFbKVf8R7biaOgp
	OdfVKpRwwLjxH66+hAp5Fcr/pZT+A/ekb8oWrO9+TYmPpSm/A73L8JJQG3i2rvF7x5fHOlNzl/X
	ztsc3PwqNcNXvvuXm7qwI=
X-Received: by 2002:a05:622a:114f:b0:50f:be4f:465e with SMTP id d75a77b69052e-514621c7463mr35104891cf.53.1778060397371;
        Wed, 06 May 2026 02:39:57 -0700 (PDT)
X-Received: by 2002:a05:622a:114f:b0:50f:be4f:465e with SMTP id d75a77b69052e-514621c7463mr35104571cf.53.1778060396906;
        Wed, 06 May 2026 02:39:56 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a? ([2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5313b023sm19011305e9.5.2026.05.06.02.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 02:39:56 -0700 (PDT)
Message-ID: <71e64aee-a880-40fb-af76-7e1c3effdb20@oss.qualcomm.com>
Date: Wed, 6 May 2026 11:39:54 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/11] thermal/core: Use devm_add_action_or_reset()
 when registering a cooling device
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: daniel.lezcano@kernel.org, gaurav.kohli@oss.qualcomm.com,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Benson Leung <bleung@chromium.org>,
        =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Amit Kucheria
 <amitk@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20260429161430.3802970-1-daniel.lezcano@oss.qualcomm.com>
 <20260429161430.3802970-2-daniel.lezcano@oss.qualcomm.com>
 <CAJZ5v0gYRuEBhdfeZ-kcwFPWxrRVFgA7+mBoTMnfeRk=8MBsBA@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <CAJZ5v0gYRuEBhdfeZ-kcwFPWxrRVFgA7+mBoTMnfeRk=8MBsBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MYxcfZ/f c=1 sm=1 tr=0 ts=69fb0c6e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=1F2BGs9EjK7Z-io_EIEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA5MyBTYWx0ZWRfXzxHx+lerNn91
 O59h9N7E9hluMtz00Cfr00rb+Ujw8fjXY1dhU2UREbbj1Vtk3G8LAmci5fZ0121vTOm5TuRJdLm
 r9pQETYnuWuNDVCL3D595paz15e8hD5zCXtwrVASjirFkqXmaGrVZlH4E2boxjk8afMRsC75kU7
 pQYeUANc6o6NOCBZ57YfIadoHDV84uP/IzvYRfcvq0QAIAcrbHztsvqMjpRidvrysETfMb0O35F
 gRz1V1o+bxNHoaH9UhP+/mjRAou29eRijhM5+k7diJgYxf8M0OVolyXz4oZmUJZh3EKl3L9GtqY
 y7AESiojTn5EFPiYhuVvOzimHc6UXHCEFJ0lg+NCfXcMIAo3G+l2jTZoR6PgOeLuO3k7uFuz+t3
 m1kmvTidYarFjUWqudAJb1QapSI2v0nAlUFZRcbfM5pB9jEPJCytdcSkODu7p1OjeDfgX86OqVs
 ETpjVNDs5oFqjalv0Iw==
X-Proofpoint-GUID: Ad9cu8pyspNkCEW84V_hOWYHvyntlhke
X-Proofpoint-ORIG-GUID: Ad9cu8pyspNkCEW84V_hOWYHvyntlhke
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060093

On 4/30/26 21:57, Rafael J. Wysocki wrote:
> On Wed, Apr 29, 2026 at 6:14 PM Daniel Lezcano
> <daniel.lezcano@oss.qualcomm.com> wrote:
>>
>> Use devm_add_action_or_reset() which does the replaced code. It
>> results in a simpler and more concise code.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> 
> Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
> 
>> ---

I've applied this change on my tree

Thanks

