Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3509A3B892D
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 08:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081544; cv=pass; b=ZN0wKCbAbFF0LmdFPMG9m1+n8OAGnk96e0ISCg14f2ALHG5eSdoRRN/ZN96cryHEg6FvVHwwlC74OezSt7aH9quDK0DdfgQuHknnlQIPzAdBAff+P1iwHjEgyVT1XH6gQ3fFOzylniXPqbawGTK+GwvJO77tE2lEPMla6wfcrAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081544; c=relaxed/simple;
	bh=odqsSAUAQtXxk3E4rfFx1F7PpYVMO4kpm8sTZf4tAsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q5V1bLjbZ1VQpi1SqDPSNlrg+zABZYOTmBx/YUh6kVKdXk+RJ7CWwdOPgjo2I41rvowoYeh6Rnl6DLvVfULiYau+Ap2JDXmKB895VD71MJkCjwu/Bw+976vVH59b1OqfKVSoE0bXRFLzCxNh2IP7eujLkmDnX5PTfsAOMKZfk94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KL2K6x9a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xu/90YS/; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KL2K6x9a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xu/90YS/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7ipHO997567
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 08:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	odqsSAUAQtXxk3E4rfFx1F7PpYVMO4kpm8sTZf4tAsM=; b=KL2K6x9aOJPTknps
	xPR9tz6DeBcKdJWBYO+U4UWcDapoAQRCx6MWwGVDZzGZW5pBZcf5BYOyw6GUMcmv
	3DS46ddwwWiWRSFEIHwfsqreNykCH4Dkj4vdzfDveDvx60JDhrx4RSC2Q1JsZBd9
	LRZA50k+0kJeoX+Svlee2Cd9U83zD6NcuZagD9TqgepoebxnT9D8f6JLziwQBgtv
	JdukJF4EpWQYxT2wLslj/vuhTTSSEAh+Dj8akglLet+wdzMxXOHkq4QTT6gI1W3T
	YD3k9nGMi9kZ+26I2f/9ICjujZHjadgbjyxNgXMBW/VO5Zw70W4i5E9XxxScA6qG
	Ec3A+w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq10a8x14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 08:52:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915b9dd020cso971864485a.3
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 01:52:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781081541; cv=none;
        d=google.com; s=arc-20240605;
        b=IjZ/JpaKZV+f9ByGaNbxb1bjK0bEzEshbY86xalMVnVc8Wo2CHO2gBpuWEKKacbXRi
         Me2IOmbfdfDgSye7JpuxtVUkvCG0qu8vXBHr5NUq870qDkiMOuP3f0UF0UkdQhsbXV9O
         5GG/YHNCocCERbxAhHrywNW93E1ZZyRBLQpnCi/iAcAcjafwSEFsV3VvMg1mYqhoPd8H
         C2OB+aGK/6s0Z825U7n1zHhnaJCQYKZISrAkV99Q1JdBjT/aKrYfxpNwF187U8uWJdmt
         OXw64vCi7jk0mdbloP2A2oxHtcIV/iV+L35/GBxocu604qHDrpx8nT5wLyrHgMDnITqi
         ZjQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=odqsSAUAQtXxk3E4rfFx1F7PpYVMO4kpm8sTZf4tAsM=;
        fh=N9Z87eG/HzL8ti0cgBStMTEqiW810YfndzyMugtMrHs=;
        b=el+yeFK61r1+i7im9XWcVdcKRg2zLUcvwBKHvm9ypXhtclp7eQK5ufRPsZNyY5auC+
         HXlBX6F1Gy9JLIkpBJJGNWYljqXAqLJ1lLXakJr/+8NaQLsfSvH/9wBvv+pfIO5K4voR
         RqYqbnBffeNvapX7ufo6pzqVXlDoEUPJle1fkaNjlh1Oje1Vq3uIdLW5zslF/GMJymk/
         +29vYEWcneHQN8wZjISwKaHSRotdFbdeZxz6KYhIgU4+bYPEupvfnabKRd3e2f6hIITN
         /GYiKLn9cLt8sil1PTIMn+PFuCyG4E+c3p5IUMBzeCiTmGz4HRSIrL5uBPfODp5gELGe
         ZvBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081541; x=1781686341; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odqsSAUAQtXxk3E4rfFx1F7PpYVMO4kpm8sTZf4tAsM=;
        b=Xu/90YS/N64ythn9rkRa82Cer7FQEdpUTpZlbE7sKzN2NfGJg9iZbG1IT867r+zRAT
         /9RbObnLKnD47EOqPdv78PwLfXyX4QLIYylpVVDW8SOeblRpqVb4r2tNoDZlVNVXX9LA
         aDPLgFzcFQr4eHzf+zROU+/ceDlw0Yo4nuMcHs4ZkLM3FoTmC5xI8soCE5Z5umR4WXp3
         H3Tc74Nyyltk1Jy3h97BEZFjTR3XdHXxFRFgD+NBt/WdwhH5clkPrCb9LlLdvwEuVOk3
         J1SlqAYz/ZhUP08DCZeVQfusi5cT71dZ3rPeV/ahoj5qU4czwZtR5jHFmr5Dgb/rxE6h
         SRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081541; x=1781686341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=odqsSAUAQtXxk3E4rfFx1F7PpYVMO4kpm8sTZf4tAsM=;
        b=huL0nT8/VflnCn86uIif6P6yKLVIBfhbr2n1KnV6kjIGTRNwE9Bkvxo2p3EyO01fPD
         ZphoNap8/aZDPXVBJhjC4UGpHBnoyuIl4DECurMgsRKjITWo3yfMGLEUXGydEhznrjch
         cc+XjrituWzENmWFY7N9wTnqC6BRyYT2O4S7Kuni8cbDw00RI9SQzs97gARDp1ExigGl
         /iNKcFOP+/UZFEfPDp56b63klN/DQshF9UqgX+YuP9BK+KFrsPGVjKMiqmt6ut1jBa0Q
         GZjlJM2iW++m9IY748ieWzHLg3UnpwxwL3q59ojg2qZwMaGENUmmTs9EqO7F4aMDpzWH
         JECg==
X-Gm-Message-State: AOJu0YytR5blGBIVMl5TQPvIISd47CZ3FYyNnOqYO4oxsOIpwCI/3S7V
	ef8bBOvKzJRhyz/JbfpJQX46fNQfDBvg4eaj9BfUHuvWACn55oFyFxxLuA5+ngUeIcXILNgdTpp
	i5d5tTO4EGP2+EZ+Udyc3m97O/nNSUplbqBPhZL+Vm00lIHMizsXSxwgypXWkejnEfKOLlLosMd
	P5v51qlEqCZXjbnI5aqvNHdofuaqa9iTNZ1xHdxzpq
X-Gm-Gg: Acq92OFY+dheuFi8tERP++7b+PGQyBe+7hIUdugmDzA7cziO4Mka2P+34na+LGblAGD
	9TgY2B4pmCROC3B0Sz0/KPcmewkS8yk/1w/Svs3shV+80CjODYzj5TA8i+qaH1ARzYlybG1aR+Q
	Ze22vilGcv1hzcSH5TPCMkuCiYw9w4nozf+VbrIfpifdCFPdyLEYmsp+IlE+r1mBvbKCuf5J64N
	9SlFYn2axseHYVOqt3oisZOx94QkX+vX4+yodnhVIhhqFnCKjm9blEB7F7DvwiGQSHswlVjF76+
	aCk71P8NmK97yRbIqE//hj9lIMq1XYqm
X-Received: by 2002:a05:620a:4802:b0:90c:e5b5:65f4 with SMTP id af79cd13be357-915a9c35164mr4069133385a.2.1781081541437;
        Wed, 10 Jun 2026 01:52:21 -0700 (PDT)
X-Received: by 2002:a05:620a:4802:b0:90c:e5b5:65f4 with SMTP id
 af79cd13be357-915a9c35164mr4069131085a.2.1781081541056; Wed, 10 Jun 2026
 01:52:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-monza-ina232-v1-3-925b0d12771b@oss.qualcomm.com> <20260610083743.426C61F00893@smtp.kernel.org>
In-Reply-To: <20260610083743.426C61F00893@smtp.kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 10:52:09 +0200
X-Gm-Features: AVVi8CdDGiDMvfVhFz8byRRYQf-ubwBArYML935S-TUUtDcg5909zHFU_AmRQ2g
Message-ID: <CAFEp6-0vRdcc_MekUZy5zASXZQHNzYZC=UCVj2yYRzno1qE6ng@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: monaco-arduino-monza: add ina232
 power sensor
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=GoFyPE1C c=1 sm=1 tr=0 ts=6a2925c6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=e5IIi1m1Uc3Dfl-nZHcA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: ZNv6nJJJMDFD8VSEbsb2Hte5Vm9TDH48
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfX18mwax6Q8HJj
 OZdNXGkyGHt5PSZlFeC27yey+zOI0oB+LanNME0arH8UZvej+6jAlDiEHyfHXFK6f7UAucOmRZ/
 1TJdQ7eEIASAGO6P8Uo24685p1NuquhQafl1XS58DBk7wEpd1Lo88f2R643iY5/UWXZKq74afh+
 Sl+Sce4KSLqPZBjlWWU75uZgMUUBZecLyWGQsm/kJmyzhA7nVRW5rcOoO4+0CGQMdUB1D7jQ4UZ
 xEE5U0c+ZVD0I1t3HkI6hTV9mQPD5wLc5zkmd4T0TetR33DRnkGEadsgWyQTtJzCx021qczwB8y
 fo6ZySd8qGX/ym4lEHKZRhfE/kKOeMarlTcEaokvuJIzY7IO5XBPon4upzjIuFj+ZMVpJ9dPCnj
 QYg3YOvnUt+DCk5c/FftjQxXL+CmTRazxGnjYfepVZX/n3D1ElPydP5AhuF17Y6jgU3l2ZKoiY4
 7HtQajDZB4p3WkxF5SA==
X-Proofpoint-GUID: ZNv6nJJJMDFD8VSEbsb2Hte5Vm9TDH48
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100083

On Wed, Jun 10, 2026 at 10:37=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The commit message incorrectly states the shunt resistor is '2Moh=
m' (2 Mega-ohms) instead of '2mOhm' (2 milli-ohms). The device tree propert=
y `shunt-resistor =3D <2000>;` correctly sets the value to 2000 micro-ohms =
(2 milli-ohms), meaning this is a commit message typo.
> --
>
> commit e207629f293c0c8e295115a6f01dea08156bf3e5
> Author: Loic Poulain <loic.poulain@oss.qualcomm.com>
>
> arm64: dts: qcom: monaco-arduino-monza: add ina232 power sensor
>
> This commit adds a TI INA232 power sensor to the Arduino Monza board's
> device tree. It configures the sensor on I2C12 to measure the board suppl=
y
> current using a shunt resistor.
>
> > The Arduino Monza board has a TI INA232 current/power monitor connected
> > on I2C12 at address 0x40. It is used to measure the board supply curren=
t
> > through a 2Mohm shunt resistor.
>
> [Severity: Low]
> This isn't a bug, but there is a typo in the commit message. The text sta=
tes
> 2Mohm (Mega-ohm), but the device tree property shunt-resistor =3D <2000>
> configures the hardware for 2000 micro-ohms, which is 2mOhm (milli-ohm).

It's indeed a 2milliohm (mOhm) resistor.
