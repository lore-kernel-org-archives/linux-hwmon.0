Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504894;
	b=TrsOGc/t4NlKe94NsMkop5drP/4JW5CbBxq8MLhbOE1/NejvOOV9TeC+hMtorTTcU+1/
	 mGCnbKbhSg1yS1v85KazV5Spi9wBdjQMhHo6xFdHAbK3Q5MAmpMnb9c2IKlpbyim92frw
	 9uIXvMoTxmzuI6wdXTB4VWom4ia6VT3Vl8XEHNx8wPVRh1CM4IHwAOlGb/5Ghzdv/jZIW
	 ojCEfOJWNR3g8N+wS9AcxcNkl74hY5uGZo1C84hlDm32TZ2y7xYWp/jXaWvc0yDgIOJCE
	 Pyxw3020A4+Yfg18Pw+VgKagc2lRgjLlKE0eecdCwle+GmKHnF+myasRQ5MCtuRpvpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504894;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=H/IoJEoYhSTAQbIuolZNm4zMxhN1TVHU0cu+DfJKWZ8=;
	b=QjfVSTX8ofv3ZmqHqeE+8f6TzgoVr7yPrsLIChs1V3K8UsDeyhJZ/DcFRSVH63asTu1y
	 PDzU4Cml/JMb8EEyL6//Gge70szNZm9PXlW+mZvf5VOtGnqWbt6wBdBAvG1JMe8tQVbyr
	 4oS6CytYoSMAmZraBBzue58rOVbbte/LVTpi1PKBEHwBMqVA8I9mOBu3KsAFyVeD4YnK3
	 AZGJhozK4SS6liTc9nCovvbyF2WVoCuwsPcA2pKy75+2J0XXFk3+fl+1vzKBUQB/MN0/3
	 zlRsmwyguUeO5vAqUkX0lqQ6rRwbhJxLkVlIp2IyLI/83Wq461PTb285FjBvEdcVFPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QqNYPlK3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eWXuOFTH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D00606A331
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 14:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86D00606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QqNYPlK3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eWXuOFTH
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDp8in1820653
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 14:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H/IoJEoYhSTAQbIuolZNm4zMxhN1TVHU0cu+DfJKWZ8=; b=QqNYPlK3iN0DZizd
	jG0edZTjx7AzM9Os37g5vfDpBPvpa8eoDAlkhL1XjwDuuhMIqcNii/gyGtdwC/dQ
	Duk9HhdRrssaJfnje4WOWusbTT6Zmdui7At6OMP33f8My2X8pf+YHPvjyHHMu74p
	0D9kZah66xD02sxC6KjzHY+DSYSj+h/9IX/WxZ8+5w5WXQ68LdBo9WW3O++6WJLL
	v0lxxwZGQ3j5cdgIESu2jNP0/qPscJ+UR5AZMgQMVl/HOK+Pt59CEaJLeeaVOY1n
	P0q7/AsDmIO+thg9Ozh8C5zEQYCap0qgnY9K9CHb5Wh8k3uUrZs/fWPCInw5aVBG
	7L/tDQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2sr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 14:01:32 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9906ce36960so37850241.0
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 07:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792504892; x=1793109692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H/IoJEoYhSTAQbIuolZNm4zMxhN1TVHU0cu+DfJKWZ8=;
        b=eWXuOFTH9gwLK32AkTvKsJuo9V7cDGAYgyGKQ00xh1wJdTEiAfus3K0axYJutAV9Ie
         hGxtQZRxJ6/zdnupA+Xka4DTNPNB97VaRDio8YdostNxZjvNreMCYM6aelKigwTlesfQ
         TRBQfbcRbAelvfpLCpORoLP14A+MhKOmVjB9WEcy+ncgESzNl2ZShqIKodvZXhEfFZFy
         iB6XQirSl5zycpHW+s+id6JzqcRs/J8zjI7cLjCjAJlUb9oOZj33aAByr/XJ7kLnuI87
         9NxQP9Fh3q05knPTfUc/THHqaBVI5tl5Rhb5BrwT6zBFw2IoIshgfPIL22SQ66XY6r1F
         XYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504892; x=1793109692;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H/IoJEoYhSTAQbIuolZNm4zMxhN1TVHU0cu+DfJKWZ8=;
        b=Jzni68Qx2aVvO8rHT/8eaZQKUDOzfhqAEFDRzLlSutt1VsnrVNrCaqDinlohNImBSM
         koEUjpZtfIBv0dPtcz02HeI70ekO7SVsHDj/5oDNao1rBDHAb3MIbzVw8lyyk1Jk4D2O
         w7SZrnjaQjF105CKJVydRK/iCjqEZarASFCsEaqxyjai4qadXboOls3ittxVHerxDLpL
         RKDw7Q7UPveEbIza9wm5Tzo+sqkEfBkOoZ4eRIX+itFSXRCSWjcKgE9pp+PHOZPTo/rE
         P2JxYkysn6+lrngtGQmN0OnJtwPM+K55nl2mxxEta0ntWwXt4jBzg49D4X8gkcyJsTTA
         elcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzU394/Qv8qXGh2SJTEcJ5QeYU4r8WJafTKNlkK1rq0fVxYxfbDLQv8m+MPD7gLvemRhlXRKNJjmPeM8g==@vger.kernel.org
X-Gm-Message-State: AFq9FYIvB0FdEULlM0y34/baKSCW20nUD8sgPk9GvWGR4RQMDDFGy85X
	1c8GM1Iv/tO1CSuyhilKivpvMMY6wzldct5p+GVcNs6laDSL1yQWImXyvumYyXsWpiU5ZgPJjD/
	ttUO+X709jTsd75LwjQ1sKotB/0R3XzEgaZhRCiUT+KJJPWle+K9oc4OVbKiL/n3wWA==
X-Gm-Gg: AYBFou3/S+zw0onjMCPzxy7R36ofqvYYqYEJYJWApFdtsv3DcGQhJikkB2RAwZl2Pc5
	GNo3STQmhoLs7kuKguah9wxaD2+HJ0uFntyKTo7rS66fQft9ndxwQ2rM2mTnmuSlk1/7CmwbEI/
	fyYylk+XYHuyYSB5N+OdjkRHzVN9JvPERPP5If1ON5gYlb3X+eUgzH/v1Iq5gShUzneHXxG6bdm
	q7butv5LMueSbzPVCaIkI0CRIzt1D/3hj30oo4CdV7StlAZqY0DTOmCYouyUx2YMrzAq5K6GVf6
	iYhIW9Z35XBYNBVX2VM4PdJO0LHi1XrZH8WNpXKnJfd1XnBczlBtE3m5uLEth4iTAOURoj64C8l
	93xyb4J47kDKUWnPmUb+6sQ==
X-Received: by 2002:a05:6102:2907:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7cc368e81e9mr1651124137.2.1792504889496;
        Tue, 20 Oct 2026 07:01:29 -0700 (PDT)
X-Received: by 2002:a05:6102:2907:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7cc368e81e9mr1651074137.2.1792504888917;
        Tue, 20 Oct 2026 07:01:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b0f75sm5333722a12.13.2026.10.20.07.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 07:01:27 -0700 (PDT)
Message-ID: <ad849e0a-5ee8-4df6-a679-ffd44c2972b3@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 16:01:23 +0200
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] platform: arm64: Add a driver for the EC found on
 ASUS Glymur machines
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
 <20261015-topic-asus_ec-v4-2-af6305ffcb10@oss.qualcomm.com>
 <ba7830c7-9ad8-6695-f543-c4c419aa9133@linux.intel.com>
 <e4cec04d-2c66-4900-940c-d7d3d245cc64@oss.qualcomm.com>
 <f97000c4-496d-0ce1-318a-1df5c0de804b@linux.intel.com>
 <3fecb67c-81b2-6e6f-889c-01425090321f@linux.intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3fecb67c-81b2-6e6f-889c-01425090321f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: S34UwJRh0iE745x_4xw3CoT4kWjeT0qr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfX9+hKHNy5XeBK
 j+dGNmLuBtxipwv+RIxCXe324E7usG2Tetr0eYbqbKSH0zpsooPTbVFnoGIKDah4rAaIGG1rEnF
 W/KmUsHXNGYT+ZyEnXP2uTnWr1O2tfE=
X-Proofpoint-ORIG-GUID: S34UwJRh0iE745x_4xw3CoT4kWjeT0qr
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad7743c cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=WnbzyOWOUeW_Ihyr:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=SB7vGQqGIbRnJ8eduEoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfX9Ns8HKRx8kcG
 GDqX4jvLytxhKJ7aJJyx4nF0n3Puap4dT4B6R2IvvAyURvGVqd/5uqdFoIYDAVj5UnzMVY/ZWWU
 gG8qfZV4AdEwW3FaO8CxzztNgwLhNY5ogopZc5pPo2tYh6fQq0W+MCHrmp2MHjciFS4ZebxQvbu
 22JYPeT6Lx1xsKrgS3l1OG0lPJUHFLLRUqRanclDLQTmwXVqcKM7269Zkqr0TdCxMRajk82FQap
 3uh7uutQFa5Po83fazvdwTP7FANqnm/3XXMVcCWJqQcuAznMbaxUWpd/KRStmW1d0kMbrN3fXJn
 rDHO8HEbgv7O1Ktk4rNNOCJF8tnciFFr5DdNQ0Sxk2jIU8D8jpoTLSdQkUEIp0njqi8mGQO9R4M
 jyTZZCJgNazzaDaDO4WLylxr3WIRsGAoDLh73/Wn5qyFKBqUiNNOu9ai6VP/Ytg0OLDX4hvowKk
 2d41rHCpWh+imgC/JWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200055

On 10/20/26 4:00 PM, Ilpo Järvinen wrote:
> On Fri, 16 Oct 2026, Ilpo Järvinen wrote:
> 
>> On Thu, 15 Oct 2026, Konrad Dybcio wrote:
>>
>>> On 10/15/26 4:24 PM, Ilpo Järvinen wrote:
>>>> On Thu, 15 Oct 2026, Konrad Dybcio wrote:

[...]

>>> Yeah I know. I still left it in deliberately so that in case anyone
>>> wants to audit the format here and compare it to the DSDT it's more
>>> obvious that this wasn't an oversight. Do you still prefer I resend
>>> (or maybe you'd like to fix that up while applying, which I don't
>>> mind either)?
>>
>> We can keep the member there but I'll change it to {}.
>>
>> I can try to remember to fix these while applying (I'm good in 
>> forgetting though :-)). But I at least try to check all the comments made 
>> to the last version.
> 
> This patch 2 has been applied to the review-ilpo-next branch. The rest of 
> series will have to go through some other tree.

Thank you!

Konrad
