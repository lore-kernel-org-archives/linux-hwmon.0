Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5F53515E3
	for <linux-hwmon@vger.kernel.org>; Wed,  9 Sep 2026 04:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788929911; cv=none; b=Us4q3T2U9GQ0ilShWWQH6PL0Jeoq762xIFOlukY/at1d7qdg+RLdM+jHZPbY9xuk2RHh94SU9TNAM6C5qOypKrsvqqHYjrLPv+Ar/abq8liHt5NlCBaQMmwzmntBSYFA0RkeBr6wajSS/fTZstSAVm970CLaiI5gJBNPC3JCmvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788929911; c=relaxed/simple;
	bh=5lrHC0k2zcfllWc2Fvzf1mTjEPO+aONQ1+R2c0DuGn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XD46DGbh+tW5vrqhIMfG+SFj8GFxlvM6kq/5xRtOq1og9+YMFySpHW3MAo4vtVf2Nb7vy+/haX0TD5ghDKdTO7iMR+KggIFWOIKtj7/nqtAaTq5A5Giifnd+FBXBExL+p7cNwF9BZD+PSsZIWjG+9+SSL/jKQi8AK6o3HnfCT7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MzR4Fa4t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SB1kfPL1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MzR4Fa4t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SB1kfPL1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Mg0bs3654009
	for <linux-hwmon@vger.kernel.org>; Wed, 9 Sep 2026 04:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LUlpyw9W+HelyIeeXNtDQKDxjhNyFJhI6vx7P1VkvH4=; b=MzR4Fa4tvrEypJdp
	5oeZIRoUMBphKCPDdOMZC4FblmXs+klvJnyllfroRzgHObNTr7t74xwm9cdbq+lD
	DXCosvY58OTUnVVMhEKi/QEsdLYOTe56LwHZLTX7jrw7n8233tr+hfUQ6KxMmzf3
	HDuWJJrBPsLJ8VUJUfYQTzxBic78Tk7q7oaOP9BVnrUOIQgY2rSdud3r9WRsN1yZ
	PiYLiFS5WbFQEB4m571+IUK123v1BmcadMcmW3Qc4ZhVPMvvYzr/Tfkn9GgqIaCq
	em7yPjxkCxTrZ3xH5vK84qtNGuQKIlDzlMqILsEV8Mhs4H+wRLk9n12KLN2NuwPP
	7Z4jSQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjppp2eh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 09 Sep 2026 04:58:29 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc49bb3295cso919538a12.2
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Sep 2026 21:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788929906; x=1789534706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LUlpyw9W+HelyIeeXNtDQKDxjhNyFJhI6vx7P1VkvH4=;
        b=SB1kfPL1j4nwK7UtVR3mln//J540/PONUqJTDvjxc1n4Sd++JuC9BSSI7lLFiiEDWU
         EzU7Yuuy3+OdfSMXtv1SRWGqZDUbAFXHOq+aCEJireBFMdtntA86PLnZQWusDFMoY8r+
         U8nCVfEQRNvy7xELSM1SesthlXD16JsY4a3taD6m3QTgTrWagSgt+1YwD9NIDgla6+gl
         z6iOkucMHAqfZwTDyz46inXT6oikD7WyrGDgwZl+NxSKMxoWpydzgnfLwGSeOWvjz68U
         ropDcvhIjomL7MzR9S0CNKgPzkl5tjKXl5u+sHPlAIyjZinbjcvcsCrJmPunAlK92JqN
         eKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788929906; x=1789534706;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LUlpyw9W+HelyIeeXNtDQKDxjhNyFJhI6vx7P1VkvH4=;
        b=cBc4MvX/Nyb1Bdvabd7qOfKK5LQo5ipJYKMGuIzF6LVGvR+30t8tcVSNovlBe6jdBI
         hyi/bB7+bgzsyVbaSPppejJCP+arAyQQmvJrAgmXUtecAcmSBWJ67hs7U1gDaqrZnSGZ
         Mvd2eRzACOIPFBZpzkksb6OHzz9ebSJ9wP6PfK2StnMSQN7pyZxpywr2ZsRSQD/1RdXU
         pxauVe50kM7UyUPKswlNygedJJzdHZKsgxpbH3z39VhZzYGZ4Hs+pJt2GBixcC83Kgj9
         OYVSALFs7yJTurmlsw5ouYkGEmeAheueZYfN9kiXaf7f7hheX4xTO+y9gzHpe50zJG6A
         /GyQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/j5Q4X3rEw/XtGfog29k12OPNcoY3c61qwaAN3YBBpYDRvaXhZkTiRzqrpRzpPt8VEGrHq87fuLlW2A==@vger.kernel.org
X-Gm-Message-State: AFuF++ksFEMxqITd9cvGTHpV3sS5qBBAnaxjyp4Nx5nOBicIvucJne4m
	HpS4cGjQ/Dt9GU3YjCl/w60cV6zBa5z4VOTTG8zNZ87zYZK1A+dAne19VEDArVkDYWFwB28ZXZg
	r7CCrAPun9cjUnBkk+ELFkP4Lo06puQ5kUNeUBF4LRMGJRIWqO0vn/zyNGXt5wRYq2Q==
X-Gm-Gg: AYBFou31ATxyEr9OU2hwLEguK6BOct4RBvbsmuBkrTXlMLdYVztOYd/xS3s7mtDxjTt
	yQVhkgEa2zcjWOUjqPcMbTQV7bamwDW/fKyLVUKrvQ7+LU0wmg6Dxe33/Y0iO1cYXqntIrJgSn3
	pfvJZ9/2EZCWNIR3h3y6KPotwTshpTQdDD9VZVsEZKAkCr/qQVjG5Uh6hqLTKZ6tqZItjZkpXxn
	1gstCTkW8LwZ2yQ2UcpAXehcWbyBmpsjSE6OMlQQpurIyYEzqSAGTlF/VTe4/tIxfACSabtKAN9
	Yc2oG1gg9u1Wx0qf6dkMiCJfcs1I+kAWebTXBbyHWlOyuTANwLtCayi9/dp4UTIammPCqnlUNCw
	1d1qatAqmJI6zyIsSckxic+qCZW9+5zcdZLMlb7VSQAQdSc452fU8McusolpOqC+N2/xWwW4W+r
	iTUAxvsGN4tT8s
X-Received: by 2002:a05:6a20:a108:b0:3cc:45cc:c401 with SMTP id adf61e73a8af0-3da39ff4c0amr44295601637.13.1788929905759;
        Tue, 08 Sep 2026 21:58:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:a108:b0:3cc:45cc:c401 with SMTP id adf61e73a8af0-3da39ff4c0amr44295553637.13.1788929905334;
        Tue, 08 Sep 2026 21:58:25 -0700 (PDT)
Received: from [10.79.117.175] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-334fbd5e6f6sm33551065eec.23.2026.09.08.21.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 21:58:24 -0700 (PDT)
Message-ID: <695a5c15-9028-4b7e-8e37-b2e08ad1fb93@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 10:28:18 +0530
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/2] platform: arm64: qcom-hamoa-ec: monitor Slim
 7x legacy sensors
To: Birk Skyum <birk.skyum@pm.me>
Cc: sashiko-bot@kernel.org, Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Daniel J Blueman <daniel@quora.org>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260908135801.81436-1-birk.skyum@pm.me>
 <20260908135801.81436-2-birk.skyum@pm.me>
 <20260908140849.229ED1F00A3A@smtp.kernel.org>
 <20260908143650.30134-1-birk.skyum@pm.me>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260908143650.30134-1-birk.skyum@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: l8rvIf5hPNk9C_7VBMk2Jm62AQsuwHbH
X-Proofpoint-ORIG-GUID: l8rvIf5hPNk9C_7VBMk2Jm62AQsuwHbH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA1NCBTYWx0ZWRfX+gE3NdcR8su0
 cQquhQj2vO+pfGgD62ePr4UlgWtbvoYdUaW37y6GgpUUrV/ilURa9YVsCrDZeoaDUH7XOenFOII
 DnSq+i7PUz+Ly8hKrq81ZoEw04yn2vdqKz50JDkaKLPIpXRsXGQKNIjeHoHN0gPgTXluQzAbfHh
 D5CVomKTJwZxZzHHvjJEoxbjIzmSt9xMmYjKPDfWaCj6nu75X1LL4j6dDhknD59AGVb+LjNelMe
 aKaQVqFYV3N0FCgNhu+UstcXhk6yut3yAbg92g9K5P5vFNhs0TEYaLj7Ma6S/1PXXfF1yl1wUW/
 Y/uD7D7k71JYzMvREIwZmIYhwnr03POHaTC4fH/8gJX9EFdRC6YTpDw9NeD1ojkmtmgz6p+KXl1
 CnH9ra0aJxGx4Do6Xb0BQyNBjuOiNVj84dS44MipFHA/Hw8ELu1gEO/xLx6i7/BTDUq4akUHA2q
 gpCvdl7vXY+EVSRvt7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA1NCBTYWx0ZWRfXw7ATMg5wd4Bw
 o2baZyDwHkMEz3f/QxFK3ZqRaTj+UxFsrqn+GXiqaSxpciilRB8LTxJ/MleC4VDkP2wyg4rXx4F
 zwE2HiGxCaxngSmUcMzNAg8R8eLe2xc=
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=6aa0e775 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=IA0wh2spAAAA:8 a=2NzAWjCmuF5XDdBpOFkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1011
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090054



On 9/8/2026 8:06 PM, Birk Skyum wrote:
> Hi Anvesh,
> 
> Sashiko flagged the pre-existing SCI cleanup gap on the reference-board
> probe path. I reproduced it in KUnit with simulated I2C and IRQ devices:
> when the thermal-capability read fails, SCI remains enabled after the
> driver core releases the interrupt.
> 
> I noticed you already proposed the devm_add_action_or_reset() conversion
> and agreed to split it out after Konrad's review:
> https://lkml.iu.edu/hypermail/linux/kernel/2607.3/10628.html
> 
> With that conversion applied locally, the failure-path and removal tests
> pass. Is there a standalone version available to test? Happy to share the
> reproducer if useful. I'll keep this separate from the Yoga sensor RFC.
> 
> For the other v2 findings, I've queued the named I2C initializers for the
> next revision. Guenter left the driver split to me, and v2 already moved
> the documentation out of Documentation/hwmon as requested.
> 
> Thanks,
> Birk

Hi Birk,

Yes, we already have that fix, SCI disable is now registered as a devm
action right after it's enabled in probe, so it unwinds on any probe
failure, not just on remove(). Same for the i2c_device_id
named-initializer thing bot flagged.

I'm working on v2 right now. Once I get consensus on all the review
comments, I'll post it with these fixes included very soon, once it's
out so you can test against your reproducer.

-- 
Best Regards,
Anvesh

