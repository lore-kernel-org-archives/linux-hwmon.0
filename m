Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F1834750E
	for <linux-hwmon@vger.kernel.org>; Tue,  5 May 2026 10:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777975641; cv=none; b=cwJDZH2y5po6E+VsOXq0qzo0JzKlYsIVwIhmVSeVHrgKw4+E8zUkeJ+a6frXo/KtpjADsaJ1UAkMOWcQlSxEnFcXXFSlYEMsb8tysDuxcqqX2IE7zeYis/9X7DHWLp177r/R6LoCLZPpj1vcvZCoudggZQ0bYwkxyr5eK/8Xtxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777975641; c=relaxed/simple;
	bh=O7HJ+iuUgSEmxINiGFsHkAy2ayaorypC4azbolseFeA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NOgla/8Gd8Mnm52A2Q5XhNnf/JQDF2FY1GBhsHNOWWuBDxSfmh+i0aOGpkMXBEWQCoMw5QfgbrYBKdBGmLYYTE8RKkxpsMNHkSh/Wf8j3rLrrtv7NRrVg8meLu81PDXBM1vh6xhlMHEkB4Lf5KxmyjdiwPgenJecu+nPkaH3x4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VOnCOWEW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c/YdMRP6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VOnCOWEW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c/YdMRP6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6459VeaZ2859493
	for <linux-hwmon@vger.kernel.org>; Tue, 5 May 2026 10:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1CHXNJkOqtV2IaCPgughLsXWthxGEfJxjBeiLJ6cvmg=; b=VOnCOWEW2TvIlK3Q
	ARgKxP57sMfAZQZcswPrCqLGi+Vaeaq1hkgTP8tJnJiGlDj3uJwNOpuXO7Mh/ht3
	V1ow7L0pE55AQi8YdjJVU2xRsE7SpptQpdDN7gGu1IWzT2ev6E+QIEAcE2a8lGKj
	oznFRpPL5xt40632azAwkNgIDIQQzFu/JK2KVqbIOKKrGcrmlP4VUAmc+yYuUax/
	XdyhFmbR8CMXpAhsfRuVhvAjAPKoQQ8nIbJMeMuaq6GSEUTMQBFH77ysT5uqMjuw
	SdMsasqBBvVFSM3+fnN5OLY/X6kaoCCEQuZu/VY78uqdTTpWIwBaTnzgHvJZ+F5F
	M20+6A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dye0ag4v7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 05 May 2026 10:07:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d5d1c2289so124001891cf.2
        for <linux-hwmon@vger.kernel.org>; Tue, 05 May 2026 03:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777975638; x=1778580438; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1CHXNJkOqtV2IaCPgughLsXWthxGEfJxjBeiLJ6cvmg=;
        b=c/YdMRP61bsehy4zH3CNr30nCxlTR120GoRtx+DQq0jEMkAvQq73GrwoU5aMKeC8EO
         LB/2tdpHMfMzG3iSSfFppAT/roCcMFbp9fmXQRVhBYs7Xe2g2Czya9wc//vXUQSX+90y
         CPsdcTF02aOAzS5e04zwqrTkTLHXj4Zfd5t9BYtBbsYCOJlm3kCGbI51xLSdu3FXj5aH
         kR3c1CYdMGySgTI9AHaBru8aZbPFrl1jE+zRz68TOStTXx5GOadlgMyHomyrPl/a6VGn
         REuHtWyhf6aRFLPRFSHFYH078AZsO/8ibffuGZIVoR5E8NP9rKbT7d3ljnDye6lEpTxr
         p9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777975638; x=1778580438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1CHXNJkOqtV2IaCPgughLsXWthxGEfJxjBeiLJ6cvmg=;
        b=Z7KlXJ09Gr/jIhFWrQtZ4KruSDMREj5HFKqBM4KvricdNrEiWse2yEbMGS9koMGHTH
         cMkwY8tOm940qqcVy9D/LdTnDDMLRzMDvWcHm8boSPnXZnsxl26G3eZerLL+uZmKkh8/
         7j27KnxXDSGrYYtsdo3Vx7T5C1f892AX3IJAALKeBpvThTTOW1U4ao1lTvdR6xFNfJ2T
         X7C+qM5uL/l6Gr4wKwDXlZg0Puxzgco5OaRIHP/LKVtRh5a0exO3qdWP5+WP2a77cGdN
         oFKcRSUrvZAp4ZGzkn6CK9ztSxVLE1/Gz+1auGnxbsBSX2R8J6qC8ky3N+hIE4VJC+2c
         jKmA==
X-Forwarded-Encrypted: i=1; AFNElJ9Tb+Q1StE512SIMuRCUiuAQovDtSrkynqMCM4Cs3TFwWL1D+emkWI2bP2y8dLGv/yAUtL9cWpiHRXxWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwudRoiGtXvzlyLa9G7k+CPbpLuYqFcyKtwnf5SmA1lIoZvnkXq
	IeV21Ux7gaXS8197oZF5SPAIcQVQbLmWvzPZ5lzp8GBGC6Trdx9bqyx+fEqDsesK7lFhwNMU/oS
	5BQy+Ud5adVJ6vAk004Ly++SrVG23tjtmdMqvR39BsP3pYHEzhKVo0ed+vRBiqc4rsw==
X-Gm-Gg: AeBDies8ibPCuE30gIPcstZrWbiqD7mi4CWS9M/IxuqCj70MBMKAF44CfN9nRJYL8Px
	24mnARgkBRfABcpL5ieVOgwyx7rMiBxLfQmVn/zdBvlp+0aCcoFpsbvXjQj1eUIDLj13xStnu/m
	8H/f3zobuSx1rNMBGhUdiQrOH/g0eZrEV5N9ciyR1fugOoHIftrZU0jQmmuh45us9IEeGMp7qqv
	aYdSkOIIkZ444UeBUYHx6sX545JdKII1C45keMNtxTcvQb7BHmXsyb/n+F0aSysNH10dT32t+kd
	zYmUTuTIIKUoiWcy5bq24AjYvzTYD/tEBbt0V1MdSBQxnOVc14k2Z9zpNQlUIORf0ULo39O2LuM
	QHMU+L4o5Y8PTgw4XNoAST0OtvP/OqeX2YnKV2MbpcIVXvaSfVO3eZdPwVWDPligVxA+lpRyml/
	louSfOkmY/idHtLvUq
X-Received: by 2002:a05:622a:4c83:b0:50f:b4c0:62ff with SMTP id d75a77b69052e-5104bfa6b9amr181644381cf.54.1777975638373;
        Tue, 05 May 2026 03:07:18 -0700 (PDT)
X-Received: by 2002:a05:622a:4c83:b0:50f:b4c0:62ff with SMTP id d75a77b69052e-5104bfa6b9amr181643591cf.54.1777975637812;
        Tue, 05 May 2026 03:07:17 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:3d0:c2e8:9f02:5c9d? ([2a05:6e02:1041:c10:3d0:c2e8:9f02:5c9d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052a48c04sm3430045f8f.15.2026.05.05.03.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 03:07:17 -0700 (PDT)
Message-ID: <731f3161-a202-40e0-ac22-aa16ea58e832@oss.qualcomm.com>
Date: Tue, 5 May 2026 12:07:15 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] thermal/of: Move the node pointer assignation in
 the OF code file
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
 <20260429161430.3802970-4-daniel.lezcano@oss.qualcomm.com>
 <CAJZ5v0jTbOkR8Odok2Cq6iWHGRzkF56spHr2xp_M8Zayg6ZAfA@mail.gmail.com>
 <CAJZ5v0ikmPwRq6ykwCH=Qi7Z477sTktm5dRU721Ye6+qQKs2Dw@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <CAJZ5v0ikmPwRq6ykwCH=Qi7Z477sTktm5dRU721Ye6+qQKs2Dw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5NCBTYWx0ZWRfX4caoDFVoogxt
 Hw/7KVwg64AM0VRrs74Me8M/dyn3ATnlEKOwckF1BtUGKfhg5Q8RKr26oEUC0tTmDEemJMhLyV4
 kf5k/zMsAOGwtKmA1MQheGBfkJAJb228CuHWgNIe68oE0HGv6Q+H0EJHaInfL7KAUXEFMSmb8pP
 rBlfWAxhLX53je+UDM41ncbkMLesvSRq/08oa3vJEo3WUfcK73aJadFUJrhDfs4WVuE7DQzwv5r
 tDH7YQTO/w5WuPMpazKwcdi7u9e06EO9YuslrxyeSAEOqo+LfzS6+6Ix1LTO/glRSpM7KO5bcTu
 SQnIG6ZaKxCS7Ttjoa+ovhmOXgtW9FQQJ6QpufJAtpLRiZz7YPACkeOCK/a2S/hZrVYC4EwVEmQ
 tAT3Ztn8oqOlQg2Dbcgg7LG8lIeBYYWy/ETQJWS3LpacG1dnXss+Kk37N4qKHxCR8iYtN6uu2LM
 vQI8tRc1mkGbvoNcSJw==
X-Authority-Analysis: v=2.4 cv=Wtkb99fv c=1 sm=1 tr=0 ts=69f9c156 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YZGnXRgRHs9QsuzmzP0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: TK0lS58JW0nF5DxOnCmdtIKbnNDHVrYe
X-Proofpoint-ORIG-GUID: TK0lS58JW0nF5DxOnCmdtIKbnNDHVrYe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050094

On 5/1/26 14:50, Rafael J. Wysocki wrote:
> On Thu, Apr 30, 2026 at 10:12 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>>
>> On Wed, Apr 29, 2026 at 6:14 PM Daniel Lezcano
>> <daniel.lezcano@oss.qualcomm.com> wrote:
>>>
>>> The node pointer being assigned to the cooling device structure is an
>>> action done by the thermal OF only and does not belong to the core
>>> framework code. Move the node pointer assignation in the thermal OF
>>> code. Consequently, the devm_thermal_of_cooling_device_register() can
>>> call its non-devm version resulting in a more intuitive design of the
>>> API.
>>
>> I wouldn't make this change.
>>
>> It adds overhead to the OF case that's not really necessary and
>> complicates the code just to avoid using struct device_node pointers
>> in the core and I'm not really convinced that passing a function
>> pointer to __thermal_cooling_device_register() is so much better.
> 
> I would start with splitting __thermal_cooling_device_register() so
> that it becomes (sorry for the white space breakage induced by GMail)
> 
> static struct thermal_cooling_device *
> __thermal_cooling_device_register(struct device_node *np,
>                    const char *type, void *devdata,
>                    const struct thermal_cooling_device_ops *ops)
> {
>      struct thermal_cooling_device *cdev;
> 
>      cdev = thermal_cooling_device_alloc(ops);
>      if (IS_ERR(cdev))
>          return cdev;
> 
>      cdev->np = np;
> 
>      return thermal_cooling_device_add(cdev, type, devdata, ops);
> }
> 
> where thermal_cooling_device_alloc() does all of the ops and other
> checks and the cdev struct allocation, and
> thermal_cooling_device_add() does everything else previously done by
> __thermal_cooling_device_register() itself.
> 
> Then, it could be renamed to __thermal_of_cooling_device_register()
> and the non-of variant would simply skip the np assignment (and it
> would not take np as an argument).
> 
> You can deal with the devm_ variants of the above analogously.

So we will end up with:

static struct thermal_cooling_device *
__thermal_of_cooling_device_register(struct device_node *np,
		const char *type, void *devdata,
		const struct thermal_cooling_device_ops *ops)
{
	struct thermal_cooling_device *cdev;

	cdev = thermal_cooling_device_alloc(ops);
	if (IS_ERR(cdev))
		return cdev;

	cdev->np = np;

	return thermal_cooling_device_add(cdev, type, devdata, ops);
}

and

static struct thermal_cooling_device *
__thermal_cooling_device_register(const char *type, void *devdata,
		const struct thermal_cooling_device_ops *ops)
{
	struct thermal_cooling_device *cdev;

	cdev = thermal_cooling_device_alloc(ops);
	if (IS_ERR(cdev))
		return cdev;

	return thermal_cooling_device_add(cdev, type, devdata, ops);
}

Right ?

That is what I did more or less initially [1]. It resulted into 
exporting thermal_cooling_device_init_complete(). Here it is similar, 
with other functions.

The reason why I added an init callback in the 
thermal_cooling_device_register() function is to centralize the cooling 
device register logic into the core code only.

By exporting the thermal_cooling_device_add() and 
thermal_cooling_device_alloc() we duplicate the logic and IMO it is not 
desirable.

By introducing a init callback, the core code gives the opportunity to 
any extra layers to initialize some private data in the cooling device 
before the init completion

[1] 
https://lore.kernel.org/all/20260422174305.2899095-4-daniel.lezcano@oss.qualcomm.com/


