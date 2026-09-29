Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A705B4FD783
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687871; cv=none; b=d/YNIRb7cvu18WRfhyL6OULjBAgkwRAz9orCccE9PEqJlW7Icq9+H/ZBOcCFI6XuZSznmjjwNHLjjUyfcAHyKi9EO82hddp2TY92BBgtmTWjO51AwyB58AFR3Il5cU20LJnEf0WBClw9ARgtOx0hGd2wMzM3hlrZDROlsKzvv7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687871; c=relaxed/simple;
	bh=9uITES1c+z1LwEDwwhjcHSvT6lcopxRkz7KYTY2wSgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WmjU443gE3y2Z6PIm1cVmRgqGo/xl+FxegbCVvEOvfXdcfXOSArZqCbT/jWVtArXbRjGVI/uOyTTrRYm4RGR69ZSF/Mu0Q+Gz4+Vg4kl0Jq4wpICEBnWcKhNDMqckLde6eCqDc14YMq16nLCQMA9SsHZUZgdEM9xGIG7DNXhA3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PMfaLW/Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BN8GO+B8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PMfaLW/Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BN8GO+B8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqdq1204825
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hOM6D8WYiBBJwNCJU5OIk+JD
	Q8hRCCk2RfwO7zCPqXg=; b=PMfaLW/YrGuBxy1SB7cio23SoWepq8x6J0tt4O/I
	0Qmp4rots+8j4MIA1GQ1qw3ECR6GcRyMMOqqY4FX7leyLzHoGUHcj3XhbAuNMkQy
	X5lhfjXcy/JnTgdlyTfaG17rz0Bs6bzCXTR1vaZy8yU0LiYEaaJ0YGvwYl9CiWLF
	QsJK7zowDZgO8CMzrvT4fdu1OOICh9R88sj9cA57GzA/o4Ud4Xo5uCVpZzi1Fei4
	SgUK2tu6wyoaVfSZDSQTa68pW0IxF84egKFdmeYpVS1TXopbjQAGhyvs6eiLotS1
	BI4DnZz6kWOu/H25YV2+JEdDDtK1Q8yycEsvslSD3eHHAQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144u56w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:17:47 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7b58fd86edbso316530137.0
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 06:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687867; x=1791292667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hOM6D8WYiBBJwNCJU5OIk+JDQ8hRCCk2RfwO7zCPqXg=;
        b=BN8GO+B8n38ORXombr3H7CSiJ98HK10OKxQa0OuySxKFNVidD9VyhmvMUDCpPtDkCI
         2Fkd7O9wfX6S8+LnT3KlSwxpvSiZTu7MIVV+EACZIBMoa1hi2OMkczJVNfMdsQCYauYZ
         FAk4qL6i4t7OmEIEHU8uxWWcwOCZ9mg1IspZmKDPmDk4osBddwggaUoZhtLEhOSeKj5Q
         JVttBMeUQRmnndZXtjpRRxGdTIXC9VDgJkz3Bo9b04WK7RrusDPuCrFkEhmGIceXOJU2
         WB+BmDJbkQpW2/UHSVqMNpMKOmSfBTestIoXL78F1uLXA0W+jpXqKfxbbXfVXgCuu5cn
         SIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687867; x=1791292667;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hOM6D8WYiBBJwNCJU5OIk+JDQ8hRCCk2RfwO7zCPqXg=;
        b=aMTmXb4FtNSPReBTGe+fBhMTA4jsWh0Rhab1feJFqnzPxCI9/tNK/9p/Y65udZqjV8
         IvM2YxvYP9QO5Mxk4LQ2wTthDmtIt1exSdoshg/21GI8mDiRV9VwbtFF8qeSd1GYcYTT
         a1oZ6dBq74yHguJx+10Gs43lVkCey/WWMBmBtyhmiHLTzO1iEvYUqnmeM7SGGTy4lU3H
         sDlHInddwk2PHU4n3L8WjYeh0p/3RdEV72E20XP4ep12ZBG+ZYWmdShQzmh6xGnZ+SH2
         Y5R4kyTGQdCm8NBZAhJOQQkXdvfGaMQLayP2rQ6JknS04L0cWCNV1tCQyMBj0m9G2WC/
         ofsw==
X-Forwarded-Encrypted: i=1; AKwUvBy0WHmk3MApQbWrULX3CC4FRkeklK9QyoVEhBAl1PrCfE82TJK0JyUWX23oiTv53QthZeW/Q3F2qhuMtw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKjnCSqy8pbGzTomCoeHqfucQWi27lu4ULlet9r5UauTf9p+HY/
	5PPXbnoYx8YsxQwQXQHczFFCgB/DHDwBUTL2GyVp6lBaY8GgmQvi+h4tR/aPnPxqj4f1U1S+jHQ
	hUCOm7g/Fq3EJmhzH6vFewbY1VjC0AUEIt482niXdVMSgFU1LxfZ9vx/VuAve1iX93nS8t5YDtA
	==
X-Gm-Gg: AYBFou3CkxkPxeolsYYMbK+E6mSNO7SRkcWs2f3gYB23xeVoTAbU/mXXvvY+F3K4Zhe
	JyyQX1amtcNmLhELoS2BzodOwwRuAWTAPhaPHdnkKjv31oAHK7xZr4abgVdQ7QjSQ9nKka+0mpO
	dCi/L8aeryau7Cs+k93V1Q1UFL0oiCruKV5TG/KG4+oXzJkEeiMHFakv31x51Dz5Q+SJB128/M3
	LqfEqJoEhDhr6NL4ckYVLHy5i50CgRsSD430q6a2Zl+TMnJ1zP/382Wg5gFef2b/n66pyu3Ftbj
	uI4qRr+hxbRUq4cNw87CVwDhJpRkkbATYcl+UdZpj4SOQmhuV2OJLR10JexjnziVn7wZqTZcpLB
	rMolEldQG++nwkd4=
X-Received: by 2002:a05:6102:390b:b0:7a4:c3b9:1e99 with SMTP id ada2fe7eead31-7af1e9f582amr4743111137.19.1790687866809;
        Tue, 29 Sep 2026 06:17:46 -0700 (PDT)
X-Received: by 2002:a05:6102:390b:b0:7a4:c3b9:1e99 with SMTP id ada2fe7eead31-7af1e9f582amr4743103137.19.1790687866208;
        Tue, 29 Sep 2026 06:17:46 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfe13a1sm76923395e9.5.2026.09.29.06.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:17:45 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:17:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v3 04/12] arm64: dts: qcom: pm7250b: Enable BCL sensor
 node
Message-ID: <nqpxb3zpvlpzw5ots6otyr7v662q6ql2dk2sies5w64fvrfbhh@5xd2nixnjnii>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-4-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-4-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX8W491vckHytK
 P4yBNTVkJ1F4nAqM8Q/Q0XpEHyHYPZTUnnZcSK73LVb2YRA3r0+0U2cP5n2OVIIzPIZdJZfzFSg
 SJa8UWW+zGUzo2YbOic9NzmJn+OOhxNTpxDashboN7ZzFHzDWn+oLq56O07wFFtA3vGv66A4IwU
 1/oU+ZaLxnniFOPzj1J7MQlx4mi0DECZTbAiNadJliyiM6e4l6bPBWhKFAWVHHwvQ7aO/LuN7So
 polTGL+9uooCb6nV/SfpkerI1I/5UzfvA/rZM/9dD/xpA9MQ1huHWCkDNojpL06wz4+QT5ZLmvG
 YxpMzeldW4Zv/88wJXdfDHHidiWshk0f9atjck25GEngIydOja6A9QvaMHSBHZEp7a6uMJHQJv5
 1jyW8C820EAr8UlgzDr9iQi+2VAY/UlB4NRbqXHYfCecnpmMOnD7GOjaoZSS65jhG8bxaVYEE/D
 avgAeg9IEndg+Ms88+w==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abbba7b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_82NC3t17uPQdkoQo54A:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: bvAZO1QyUgpEobuvhBvZHi9zOunnhpY-
X-Proofpoint-GUID: bvAZO1QyUgpEobuvhBvZHi9zOunnhpY-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXwFrqHx0BzzVU
 i+diZqCwzn85mLknZWzQ2dy0GjGb/ZN2Fb6n3Ln39H65nx2LA7xjGgrsHXXBSTH/k7kozBsSjel
 ew5Zfp6vVFTa8ILiCIgl0ymdrmHhSp0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290052

On 26-09-29 18:39:36, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pm7250b
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
