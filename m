Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494F24AB3C0
	for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 12:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789733925; cv=none; b=eCZgcpbTltH8q0sGsVlPXS7sWCwDyUOJgzFYW3x/x8i85/q7G3RedOXW0faQO+qANfA85sTqBvRggAbyIKz/aJiNbpENIq3UW7ZoSTIa031Vr1FVWsEP06QhZCot8VMk7VFiGWCPG4oWwwjDvZ9ov7y2TWeymLDxvySdzFfKS0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789733925; c=relaxed/simple;
	bh=wapxrbOKn0aJ+lRvm1E7CjXQYuLnjYoitWtQ+7teQlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EpzBQGUONqWpnGu5Qfccw8TbYKvavuBXUNdwtnixEja6q0Dt6FGmCaaGfgtK15JX26i98AYGg0+l5fNBlQ2HkmJnH53GVel7JoYZvxkYMANpKYi1HfuUZ7uJgxJ4QBLwgOInmPoCVKcOCRt7UaS93QgFNQSpMzZqzf8zJVTUYkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hIVnV7Fk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HUzbzjZc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hIVnV7Fk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HUzbzjZc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IA3eDS3208516
	for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 12:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e1YPzYuwWx4GQll8y/pnlimp1lFMP988wsR4cR+Oego=; b=hIVnV7Fk2rOPC2+Q
	7XI/n3bpaC6WD9gitchTLUpGTFRPt10Dli4VF/T0zBviQTzRbBnkvlF3j5IZyWc+
	9JMIKkUgFMs3ablTZTGJkI4/Tl38m8GphLLeo+odRedmdfQXJrAWTW8DJapPwUt4
	PZVxGNcLy3mjz457GCKGksfFmwAraseJ4Wye9K9hBh9au1aCPhxF+O+N138QcQwO
	PgQDBsKjYMyG6XIKtu6Ds1ukxX8ODQdbFpoOgxmduyCcKY45hXC669xnhrlEs7AD
	Xe6yESzibXRIRrZXHjjUST69VReCrCfnthb5rb0kqdB26mRh3iYs9EeEccTDrcPv
	QuEGfQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs37dgf0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 12:18:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e661ce1dcso14359285a.0
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 05:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789733922; x=1790338722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e1YPzYuwWx4GQll8y/pnlimp1lFMP988wsR4cR+Oego=;
        b=HUzbzjZcmlDTQt9LEPgf1V5G/kaU0o9ooLDj7lBHDM3DwnAhAVAz/Ud8gLPxGcISn0
         uAlo8vlC111b/K8fzw5UXlTT1RegmcM7nbW3FiIqErd+g0bR7pjdbfgmSVQwjfXCnmJc
         mYkmqO6weRgAHuCUvObHrtWSk4Sp1B4QFkLpqFHkXAUoga4mWN2O16SeZTq53HgU9kdw
         36kTMUeNK0/VL2wPNXkaaZibEV2dok2+Qh07HsKxP0vX8yVnb4zRh9/7Nx2eu6Qj/OAu
         YQ/VVEqaPYJvNlMZk6hXAPZ9qoLMBSK0z1y3wpwnYAGnCcnEZy00Q1aCp035ArA3UFwb
         Z2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789733922; x=1790338722;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e1YPzYuwWx4GQll8y/pnlimp1lFMP988wsR4cR+Oego=;
        b=mkcnzmUT+9MmwjNLke7UunhsugpxLRzVRczi5cua2WhYSD3c4z1TpdSP9PCNMnNf1V
         6/882ZN1b0pTGxDHr0m6z02HBF8n+xg4sokJCtCk3NfrmU2ohA4uXZXGe8Mr664f8Dfn
         q8jxNzJlF6R2GWdoc+cODx4QqHgA+xk3FJlSDB+brZJf8DLOAgKr4DTVg15gNWh8DX0a
         6RnYmWO661zPN6dWNEqbLpdIKH091FGipGYe+3QYaxS62vL+I55XWcUwpqW/jRI9GhfT
         yhqH4ULhusr1MtHrfN7d+kAfOf/LMzFGdmPtbPgk8ZbIGgbzUxQzfaiKPsU/JHzcJqPW
         khKA==
X-Forwarded-Encrypted: i=1; AKwUvBwJiRTpOBn8pUZQBMzhNsPdWuJddhDiuZ2PujSUvoKNaynOUHoDqZrKGxv8XX+DRM7tHxkmpkDxeahmCw==@vger.kernel.org
X-Gm-Message-State: AFuF++n44+V3tifCDSs2L42hIOCdVxTW0B/8A/SjnXSSPR2cYAYzgg3X
	UqusDCTeWKH/Na0XlBzUj43lEzAcTdkldgYyc783HL1JTLXlUVuU2oJNVPF5GPhpdjXhU086JVm
	JwBxrrlNTnSs/VGAtAo9qlaxZim4arjL6fTYMUu/joUQbwkf6rWxqluIRed7CtObhmQ==
X-Gm-Gg: AYBFou1fUqoFBU6Osm1V0a6QF2rXAvmOW+ih9imsDUO53RKTigLAniCB0RwwTwEok1h
	zssy54WOE5mYNPNdiD+iQUYLsBFTMH1TfAoLIP9n4DtHe+1NNLCKyluKb1M/EfV8x+IaGw6cGtF
	KnLqI2La9OZ5ictY7E2R9i+s17YQBdDW0DbJEwCoYqY71aECzGZHKnCKk3cTFwruVlIzPZ1m3T0
	d/1VMD4zqpgro/S25ZJlYVw/PX5Mg+J8vPIznAE4RoZzuriX8QtgERb7xXtW19yYqsU6ynNJnUc
	uWREcRPfGAtlkAK6N7M7V5eMM8Gpkq0CiuEgAfRGKE2NHIRnln8lF4DsJnPMKOQVWFPqbYdOesb
	WReAwkNbMX2ma7b3PCwWG1Q==
X-Received: by 2002:a05:620a:438b:b0:92e:6485:f640 with SMTP id af79cd13be357-93be06c07d9mr240481285a.4.1789733922557;
        Fri, 18 Sep 2026 05:18:42 -0700 (PDT)
X-Received: by 2002:a05:620a:438b:b0:92e:6485:f640 with SMTP id af79cd13be357-93be06c07d9mr240476185a.4.1789733922045;
        Fri, 18 Sep 2026 05:18:42 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa5979cea5sm785612a12.31.2026.09.18.05.18.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 05:18:41 -0700 (PDT)
Message-ID: <002eb70b-17fe-496d-870f-ac15c62fe32e@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 14:18:38 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] platform: arm64: Add a driver for the EC found on
 ASUS Glymur machines
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260917-topic-asus_ec-v1-0-373516d347ae@oss.qualcomm.com>
 <20260917-topic-asus_ec-v1-2-373516d347ae@oss.qualcomm.com>
 <20260918-calm-gainful-turkey-8ba016@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260918-calm-gainful-turkey-8ba016@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE3MiBTYWx0ZWRfX3WtwrfN/1mzD
 2+GHt+/m+1ZrehKiHufLpHjvIJ/HzJK4M6PJL7zHg08jXu/qqiSBzIsSQ9pUKVw4timGbQgkhMq
 KB9shjTQEDT+OS6+zCfcMwMLS2CMcXs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE3MiBTYWx0ZWRfX33X6PYNQ+0yW
 HWgyKw22+j2fekJi2WLaLVb59rAJup4eHY3lQz9/ZzbYqhIqGDp22VnkOv3Wcx/KHjjK05vq+ZO
 n2I/39BMJYvuD1DXyZwqhw+PgOzYXDuNfaqaqnRKzVKBzoptuJ7KoephNodBBkzvCknKPzHZc9C
 n74X5LnVhrDmnMj3V3PuYEREqS6tUjz088tLcn2Btmwi61k3wTCPWysEVcFbRYPxmgMn/kVpOiK
 yeWG1E/PUR+5WS5NujyvRDlTYkEHMMFQtnAdyfjhL5RuKRmrRGPDLppsoE3o+cYjLPJ/yIiOsKy
 jHdEAQYmEGMFNySnLeIoUTjsi3LbLad+9P8W6RzAu7x74UPh9DDl4fJtHlhvf2zcBYpG4wU4sug
 HFWroQhHk5EQc7roZNqi6zbf0ERAywoqDDM9gXDnEWpZtpcyTkcmo/kL5wUcKFqSMfBJIAtTBa1
 MpzzrHd5SFE0TW290rQ==
X-Proofpoint-GUID: u0Zx3SxsSY0f87JqfBnfuHxtw5U00WQy
X-Proofpoint-ORIG-GUID: u0Zx3SxsSY0f87JqfBnfuHxtw5U00WQy
X-Authority-Analysis: v=2.4 cv=R+mWitRX c=1 sm=1 tr=0 ts=6aad2c23 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=WnbzyOWOUeW_Ihyr:21 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=BxavHUX6cQikRYdMHAsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180172

On 9/18/26 1:35 PM, Krzysztof Kozlowski wrote:
> On Thu, Sep 17, 2026 at 12:54:57PM +0200, Konrad Dybcio wrote:
>> +static int asus_glymur_ec_resume(struct device *dev)
>> +{
>> +	return asus_glymur_ec_modern_standby(dev_get_drvdata(dev),
>> +					     ASUS_QCOM_EC_MODERN_STANDBY_EXIT);
>> +}
>> +
>> +static DEFINE_SIMPLE_DEV_PM_OPS(asus_glymur_ec_pm_ops,
>> +				asus_glymur_ec_suspend,
>> +				asus_glymur_ec_resume);
>> +
>> +static const struct of_device_id asus_glymur_ec_of_match[] = {
>> +	{ .compatible = "asus,zenbook-a14-ux3407na-ec" },
>> +	{ .compatible = "asus,zenbook-a16-ux3607oa-ec" },
> 
> Does this mean devices are compatible? If so should be expressed in the
> bindings. If not, should be expressed in bindings commit msg, see
> writing bindings docs.

They generally seem to be, but because of the very limited information
we have, I don't think it's worth risking associating them.. Would
a mention of this be enough?

Konrad
