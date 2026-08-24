Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA5B36308E
	for <linux-hwmon@vger.kernel.org>; Mon, 24 Aug 2026 19:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787600550; cv=none; b=GmJWTBj9PCK5aYwbnbsAO3UWG+fzKKNgbtwO6ju1JZ44CE0meEL1sdnMjos21mX6Wh1obm0gh81nU0P+90yH968tk3Dmn6LLW+/7vVvu2i7qQDgBtPCAkKILsBg7ui+4YVJ31I6sKRqGe3iaRPTCsDyPh+13YfGxO26KtzJv4ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787600550; c=relaxed/simple;
	bh=GrlXH4O5bCCpGXwrX1mGq1uktGs38CecZcJXGCQUd4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IFnhsdECeXY+G3coUZci6Q+YUsO5BLu0+O7iE71LMfwDjHEZjmG2aQFCiAvNHIO0Z/eWazVVWUVut++RkKvdz9rS9IZXI03jc2xbb8tNc4s+zF5sXRl48+Nxt5Cdl5+cdo2+5xmPbI+Dh9ZkwQlsyTqHWibLABbM0oDmeoaEMxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OtsWjTvy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Du1eNJtk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OtsWjTvy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Du1eNJtk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OJGVQN727689
	for <linux-hwmon@vger.kernel.org>; Mon, 24 Aug 2026 19:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hvbud63ICZojoNiymTgGTLkHJuo/LE59l93YKRYJRGw=; b=OtsWjTvytyQdOjYa
	xI/bmdPe0wPRHSfdLAv+a42ZgEPmSs7S/tJYCfP8v5bUidOf/WPHNs6PA9TWy4Tg
	K/YBvWL4YR387Yo/Qm0jgidm5ElUaqCGsmOjM//1dojlvxTl2IXT6/9Wh88PdUHj
	Yp6Qa/G9hET3LQyeVwH6UOjgoBNw4ctrcpG3Pus3MHakKJeUg69yJUKObXBzS7js
	GAsbpTUYUT1OjCoUO5rfvTE5jHTrB46DB11xCFE6KJKpAOOu+a2igUETabnFPVN7
	y+jAPEf0PRTbNt8ai1JvfiuzGXLKrK+KFr81LjdA3sXhjTqmt3+oAOPFWWljzz5/
	IDn7rQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8swr8pv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 24 Aug 2026 19:42:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso4020864a91.3
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Aug 2026 12:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787600548; x=1788205348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hvbud63ICZojoNiymTgGTLkHJuo/LE59l93YKRYJRGw=;
        b=Du1eNJtkTNs2iEC2HPrCbQ6X2cu2x5gBHcmLypQVc6uGK9UKXN7LvQgyAh003oYCid
         Jhcjh+yusK4U0sra1e8DgeZbxrMMFPus2BQcmTHHy7oQnkaqJ7k8ojzGucVv1Uk1ug6n
         wE3bALrS0a/IFe0L6alt9KsNgI4f3YjMaVX/Hv3vLxwG0a1eCWeCJu1brUwPm2CszCgv
         zgrjjc0W9s6FR9GdfCbqG1Xp20aU7liAtv/MpwF6NeS18Kc92K3bviG0VaXV7oIx4oG+
         JPoA8k5mEOY+oPl972TSSQqJx0FuGepxZDir8GywP7KRi8Y3gfgV1ACsrRQE1p6VEuo0
         3Ozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787600548; x=1788205348;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hvbud63ICZojoNiymTgGTLkHJuo/LE59l93YKRYJRGw=;
        b=AcoQfK/BFX3BlWWXs/8OaMF051dYtYJKCocmCprwDa1Bk6KOMfalmquSEXNVRtm7AB
         blSnx/sqcqZMu9NzDGefWaBlTWw90OsJVUt+TnZQ/k187Jeiq/e/jNk27FpgEnuvJSiY
         9OdxfQPt2GzoL3x6qzJDxiG7FEuFvNcAa5oPNvsN+Tw55/LHCwQDk7n3k5EZukWT/ddj
         LZudAP1DpylQLpoeCXey2wQlXGfzjLTNaUVWBeOysD0+mFBCxo0hpvSx4TcCg3cAwFjl
         e6uhcQP4pLxvPYPfhtrM49DZKwaZo/+zy6SCVRvKP4Xq9xGcyyk//dPGM9M73iHrdgJK
         cVeQ==
X-Forwarded-Encrypted: i=1; AHgh+RqXQvYW794XWsWmNDiFhXfpSGYV/U4Iuy8UGx1YUde5xhhlc569Kn1DPjCBtdzUxQgeJInVz1n3r3067Q==@vger.kernel.org
X-Gm-Message-State: AFuF++mguJ6wSs1dlaBE7nrF2hl+c7eDFXLWLfvzIPxqd0MZzk1zi4bi
	4lQfMv6kvTBa8zSvCzwakvaFdepJO981+Urj1QBtE6DMG2HqANvCrKLlNvlINRwCG8L2+yJGixe
	ZtBbU6GZapjt8GlGYzxbdWt66BR4aL/5vSSNYeySYShk/Br/0ik3IfjQiSUocOgZbXxu+3ccbrg
	==
X-Gm-Gg: AR+sD10KgF0tAHiftvGJBIQqPSTwZmEwAWgdAA73Ro5Dl37RtOQNlfm8jkWN6tMaHnp
	Y2PmmCK7Q+1p8XXTnkmtR6GppJMXkrd//OrbDF4dtjnY6jQQurHDpS9AL/IBCq+neLv0j4pEycK
	CJ25KkOZCy46FPBDWuihDLm5qLlIHQiW0EOHm7IVcsyXyUyP4eqL3mz2nPiMIu3VMGc1ABSSaFU
	fuTwNq3tvI5ZozQqqGQZlu5nhoEsUA4dCywFz3e9F2xCvb/MEZBdSbjfvvpWvQPMsomlJNydsDe
	k8QnHoe4Lc7VOJiVC2O/xH8AXRAy1QAAOU7vAY6Ll2B42p+D7cV/3Xm7HrBJDbLjYekKixOMdHY
	WIxYefaA+imqQjce8faiO/PeKiQpWORGd
X-Received: by 2002:a17:90b:1e04:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-396462b8dcamr2031883a91.3.1787600548196;
        Mon, 24 Aug 2026 12:42:28 -0700 (PDT)
X-Received: by 2002:a17:90b:1e04:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-396462b8dcamr2031838a91.3.1787600547612;
        Mon, 24 Aug 2026 12:42:27 -0700 (PDT)
Received: from [192.168.2.5] ([49.204.16.42])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860fe08csm43065574c88.8.2026.08.24.12.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 12:42:27 -0700 (PDT)
Message-ID: <293f09a2-a9ac-4e35-bb5b-e1008533c318@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 01:12:24 +0530
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: Add support for currX_emergency and
 inX_[l]emergency attributes
To: Guenter Roeck <linux@roeck-us.net>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20260813211433.879638-1-linux@roeck-us.net>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <20260813211433.879638-1-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: faJ1XR2vSeh-YAwOGixsAxXcHWuPQ0n-
X-Proofpoint-GUID: faJ1XR2vSeh-YAwOGixsAxXcHWuPQ0n-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE2NiBTYWx0ZWRfXxPUxeOFsp5nC
 8lFIKCb/HSdDL7zEAyCjKf7I9llzsy9bGb8vbxb1GPzFCLu0V/nvccC+HnqxF0dgk5zbgutY2/7
 F6EoR2dO8JEg3Tl6sHMCs9z78ijHiUg=
X-Authority-Analysis: v=2.4 cv=TqPWQjXh c=1 sm=1 tr=0 ts=6a8c9ea4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=BvtW7Q8lqb1UdYndl6lHrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_jlGtV7tAAAA:8 a=8I5V3eGuWwFEDzSFAfsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE2NiBTYWx0ZWRfXyuAyRbQYAlk7
 2+RjB4khpfzkAGC7ohoirHELM5+23EP6d2Jj6rY8KzkB6mJG3K/v+PiWP2QnnuqI1I68U+759fs
 fi/EjFzE3VuUvgZud4lISxZTrdcsc8+1PlFRPfIWIVy6c4yw2tU51T8OE/WKy14GODzjA3vnmbh
 4pGfXPA1f9FmIsYGd7xD4NC20cXy8r/g8p8gutYQfG9wQpBRWFvUdPgpDP9sHn33/1weJa1cGxI
 /FWlAvPtSWE4Wvnr97f2BOCHB/nQt4Sybk9ugOdHknsfbz3CXud1M/h8eFq9wQV3r2lv64WIRsP
 T4wQcXi8XSx+8RzUqatySdQmDHwC1tfWNUERWDwW5Sk9VYhpo5rBjrBhzz8ouYtPxU+wQcAjeuB
 kNCQCe69rwN6Zwz4bITYOC2efCToXquja+o1yaHXi3OU44ALXMHfBEuv+d0isaDB1TzhRuT/0SA
 Eahq0USDyAgS78rjU2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_06,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240166

Hi Guenter,


On 8/14/2026 2:44 AM, Guenter Roeck wrote:
> Some hardware monitoring chips support three alarm levels for current 
> and voltage high limits, and three alarm levels for voltage low limits. 
> Add support for currX_emergency, inX_emergency, and inX_lemergency 
> attributes together with the appropriate alarm attributes to support 
> such chips. Cc: Manaf Meethalavalappu Pallikunhi 
> <manaf.pallikunhi@oss.qualcomm.com>Signed-off-by: Guenter Roeck 
> <linux@roeck-us.net>

Thanks for the patch.

The change looks good to me. I applied the patch and validated the
emergency limit alarm for voltage and current sensors with my Qualcomm
BCL series applied on top of it, on the Qualcomm Glymur CRD platform.

Tested-by: Manaf Meethalavalappu Pallikunhi 
<manaf.pallikunhi@oss.qualcomm.com>
