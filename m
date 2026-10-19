Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421581;
	b=u22a9ccEgIQbHHPoLry9Iw6+5zxFn0ME8ghe210WTLwS3K2dk4gm/0zpg6yL9NcYzEid
	 N6GK1YAquEA3/7ZUPmRFQe72MNVFtAMgark1KrcNo4UkPbpOTd5YL8yfN3nGbvaChDZ8K
	 UcHbe4x0sB4cVQfyRWGTXfz2xGOXpeAQ/KqZun/KkpHBKHrOjEROhqlAOOsKZfpWQ1THA
	 DQ0dgBS+FEZBCCydkJkieH4Z0N/7t17Mi07qnpjCa/Lezpnk5yqHSkJXFkmGbIZ0slY3E
	 PFSJgmnTJcmvAE3aJ9pMPCPlb28i1XnLAfkhoZFfBEp8roi4Y7H4uFhgqcP7HHTrjGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421581;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SmP7mf1aTtakbEsKRgYC+LPlie1PGuRE+ut6DuR3Cd0=;
	b=2vR7A7no2R3oZo6MAoR6blzkmeQRvcYM/tfrbD1jlRBIT59uW8gfe1Z/2jR7p7SaqqGP
	 9iwBp96tAuKhIFiRBloujQabw8eWekEr3K7i+7+o3rV7I5vuLcq6tDMDSukqLzzcnSLL1
	 MC3OYcQ/A1PHw8lGtA3EFptBNMqUVHj+L+RfSB/lIHThfOX4tqERmD1j69TdHk7UgVXu9
	 ZIGX8jcP0IXLqwKc8Wo8u2+DQ457KIw/6TwebE/w8ZPsoBupJpWdZMWlFuvzD/HXvrMdk
	 9uPSGyKPNAjxjFRDnWRE6ZnkPHgVe9bxLIcfyNENxuPB9uHOZpKQhafR744bmAV2CQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pptyslek;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UP+22tCe;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4EE606AAC8
	for <linux-hwmon.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pptyslek;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UP+22tCe
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCA04DCB2E
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 14:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421581; cv=none; b=Ketf0L0zUlYSbbTHXQRn030DL9tFfkLRCLq/zN5tNPzTuxYTVJ5WLJhu6+pMFpm63BEoszjFAPm95ZlgDEOzSmBSgAL4gaQvyNdnFAWtNkmzz/WMON5cwzWAp6niL4ELwkUJ0C3JctBGULa/+1tNITxvNYmQLfcy8QA04ATvFjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421581; c=relaxed/simple;
	bh=Q8ELXF6LLbtqADEm3zzC52Pu10rc3XpBpK4nD5ZwOqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MB7APtzZWCs1XD527Dpr9cP01uvd5ujOBsAPL6ksKHtipqSlsHGUY4L2N4NpJDgXuly9Ji1kHWay4ylGdMth+9YARbLGPzSC+ZFUmzsEp4WVrcdTqb5bKkyMzzdMbz2JFlOyiYrIiZ5qMGQvRTtNiom5TaeGTrooqWR3rkgYlmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pptyslek; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UP+22tCe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0AHG2628165
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 14:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SmP7mf1aTtakbEsKRgYC+LPlie1PGuRE+ut6DuR3Cd0=; b=Pptyslek4ttLiH5m
	QQHolh96lkqa5dPpnl2zIbUN3kvq6bimL1s4DNm1dlnyH/0sZcX4KF+RHNiH1m1j
	rUusEkRTyh3ZrSGbYObcBDDDiYINkGr/ciZ47ih2biuwHBVgJMtTpCbJi/OZIz8e
	g7YFqFwIkJqlHbzwVxk5EnaEdH86nUgvSWNKjVC7U+u84ffDstcwA7hiA7Jbuubg
	/DrgcdXgMkjFt7Nz32G1s6clnRTtgwtROq4IoIHIWizxKJVsXH1cAI97XZl8pYoF
	xVQqD7aiGnQaOcpq6kxo3XDpx4n0OfkZLv3JjD+jh/UpmkxtR0+J8ij+QYgb0mob
	6CkQOA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdkmfgjep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 14:52:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92eebb130dcso55334585a.1
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 07:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421578; x=1793026378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmP7mf1aTtakbEsKRgYC+LPlie1PGuRE+ut6DuR3Cd0=;
        b=UP+22tCeXsHmvSoohOKJedsC+lnLk3AzOE0gsVg0VTMaftWiE9Jpchujxo5Q7RfhQ9
         1guYbcqKA0yjFJ4wx/2j8CPYQNO5XjPVX/kEz+Ac2hPhuxqnViWLIfEoENzcxYPGCUDl
         26tg6vAJXg7N4oGa6m5GQREDqfmQ1qAwA2oOt+ZvWTs5kNrXPIne/T/WNtsWKUWk7k/E
         2At610cfYw/qSTLuWvoVGeXNN3Sq4QLOW5a5HAm4WrD+vcptF3+ySpL6qbhlRNPU7JDx
         oLL2zFlj6QzEag3MhO2m7I3bfRKBS2EB/SIi0mar5dq90C8nPFsgazrB27RQYNXk2NVZ
         HQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421578; x=1793026378;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SmP7mf1aTtakbEsKRgYC+LPlie1PGuRE+ut6DuR3Cd0=;
        b=Lki6OCScotYMzCuoUD1C7SRDDR/rI/NH33MSplnNin84XUbKf0mtJRn5AWSelZYO2f
         rYGYxr7AbHygK2pNqwoGHy57Psdmz8wgzRUq2NgvlDzvHOxfzv/svRVZYIgT7wIr7QEU
         flOKzHe9/yaGplmftiUg+9kZNudMgJqB4myGvEXn4TAxvqmrmT61F6Iu3SeUBu5pTaWs
         ZiaEDESiYrCISC9kPv9uS6z9B+49hU1J4UkwnwGmBS1Yd+qsTw2qB8P0pFsRdD6X9YLI
         q7aI7sPWVwnsI2C/nTtlaQGVpzQh/Z6wwxWWU9uYlHJtMwvvqsYNjfEMNrptJWQahSFH
         oSJg==
X-Gm-Message-State: AFq9FYLJGFbaolCUd/xK44YZcDgwvwQo7f0XJSyzScQQIAVg36H3onwy
	ckSSHK+dm0YjPGMHyzBtSVDznI47oYZjiOAImHuBoWG/bsYbKtS2n+gLOoGzas4NYvCrLkCoBmT
	3tDZprA/DXY8mx6czk4wyaSm6C4kZpvcWpf+ryejLqCLzmzOvDz8+QIFBId5idPdfxw==
X-Gm-Gg: AYBFou3DEODQAfr/m+GrFXSL/frdkej8dYZGJXlfvf+kS8CWoh6D6NwUjwD0nUHMb72
	45F2aB5HSQRCgPb7CN6cmW0zGhPFBSOpNAiowLtyTcw+Hf49rRKmRm1Zs1yqc2JsYeQpLiazWgG
	AVoPiZBpygXIm5zkagJ9r/Ta7EchuIkuobD1N8UVIl2IP1vZdGn0Kc8xXDEYFT2Cn8PamVk4ZzG
	uWMyh49wx0NZ4dh+pvB51LyO4P2wt6hb0ghl9POBPEz7CZaN9rZcnV0Au+OT3E2okHCJUBchUF7
	jI0nVrKrY4G/NT2mbmCtgz9u8gzJvPmchB3Arj9QCO8Cew1CszFaAx0ZFjkyTwhXLrI0sWrcClS
	Pg548fqJFHsc48EGhGtfeTQ==
X-Received: by 2002:a05:620a:711b:b0:93e:54d2:2283 with SMTP id af79cd13be357-93f29e15e32mr1459383985a.6.1792421578053;
        Mon, 19 Oct 2026 07:52:58 -0700 (PDT)
X-Received: by 2002:a05:620a:711b:b0:93e:54d2:2283 with SMTP id af79cd13be357-93f29e15e32mr1459376185a.6.1792421577483;
        Mon, 19 Oct 2026 07:52:57 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32c075sm380967066b.11.2026.10.19.07.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:52:56 -0700 (PDT)
Message-ID: <a334b115-6fac-4417-b6da-fd0a2e5fc43d@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:52:55 +0200
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
Subject: Re: [PATCH v4 06/12] arm64: dts: qcom: pm7550ba-eliza: Enable BCL
 sensor node
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-6-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-6-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tUY8QIIJqEjRqYdywkl_7T4eQiSl-rB4
X-Authority-Analysis: v=2.4 cv=O+isLx9W c=1 sm=1 tr=0 ts=6ad62eca cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=GBzGvGGi_yB6IOxyoawA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX25ANqsctQmAy
 wXEGpOVjESN3XLz9x/nJJk1ddDl999Z7DmMawOIG1neAwrRQevA5mcnSPFGr2F606V1aAkAXzgJ
 G9ztfE57Nn/3raK6Ymz/qlab4qvZslr1gTW+1diB6MKlb/b3jjwXsg3ndpPapJkYKbu7QHlHZGE
 La3FF3m49E9VVVQ07Gw3rMxpmyB4SafGwkHd4Ef4Sn+XEUj+MIUZT037/9lQCPwaGg6m4h9WwXq
 h8T3ml1GPS551aApa7MrwKfQqQH47vVynIgsrQy4snDeKlulJLQ8SB89pvcB10a//TVXtVFx9KI
 Q6IrMrpYBZUESYB74214WkdJyazk8Un/yFqs7Xt3fAZ1AA0qnwZbgZVd9EM+42Dpcbvr4ZAOfJw
 ddVyzS9fEPypDnKI5L0eEBGRz7WSxcBH65m5+a8JJ4XOnnV/PTlVs9wa4vfLWbbzDwD7pctXElk
 rjW/S5QELcDPYREXytQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfXzURQLiOTB5G9
 6s2dnRNboelumX049GUjUs9n5ke3z5xHHsTQxzRf6XTG2TSJY0xjCTNnDDhRYda0pqLBzixJeuI
 2CG7rp4sCfYbbluZbygyAOiKwxsx314=
X-Proofpoint-ORIG-GUID: tUY8QIIJqEjRqYdywkl_7T4eQiSl-rB4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for
> pm7550ba-eliza. The BCL monitors battery voltage and current, providing
> hardware interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
