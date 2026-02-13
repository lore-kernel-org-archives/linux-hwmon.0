Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EFA26D4E5
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 11:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770982690; cv=none; b=rXuQpNAiokUq4tXtTlG9HnekUTmLTMdqscCtRTYtqcXJAXf/DAdjIvxEOc6v8pazypWOqspgbHU1AgrgFh6e1SEm2PEUpzRBh/tzEzB0DB2UJ7FL1mv/hkf6C2B1cXH3vpgUTfIu2iwo1hdgCJq2JkxSw2CVmsohLqIM0plzeg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770982690; c=relaxed/simple;
	bh=dCJnv+0xEecnsLnNJoOKxs9cpdxjLRDTdms8KKmqBAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D5foRo0I9xl9ds+RHEw1G0/v8x5kEBka7EaOZstNtQYQG2TgZ6jC1u4VWmVM7ryJd02pFY+BFXuv5hwUGhKr0gQ5GcL96STB47C1DMT6GYbPq1Pg5uB8DD0sz7ubMuW6H9+xHB6PQihcd/gXlRgUxIoPm9HKxB+7yyqnQ87gKX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iHjLIFYT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xt3x4vP7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iHjLIFYT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xt3x4vP7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D7mCK83424508
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 11:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nPXtkg0dMes2Y1OatZWLmZe0bpWW6Yg8e2HgVJt/UXQ=; b=iHjLIFYTuuoeG9mD
	nY0Vj0vXlpbgyswiCPhjKBX/UTzSG1Yc994rgYXtvjOHjJDzl3VFzap8dU75D9p9
	AQEjx7ZvN1aAx/sglOSdzJS2xWaDvnJIO5AOGsbs7mhaUQjmxBTDkQlBWQaxfgD6
	PpQ6blV6icu3FVXFh65aSMYeG1T7wGsX+igPuwW3js2ZN5Am/7z6NRKRyFdGCbfq
	2BFnDP749o7pGQHx3ZY1JSv/+KButEJ4mJOo4uZOionwZtNsGO/CIgFfk9Kob69s
	8HItdt/OqPknkKh8FCcGbhE6G3XP9P6zfAJ8PLQ8QSWLrA1I7UZ9QVRbTQ6pXsZJ
	sz2hSQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9yvrrsks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 11:38:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a92a3f5de9so7061955ad.2
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 03:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770982686; x=1771587486; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nPXtkg0dMes2Y1OatZWLmZe0bpWW6Yg8e2HgVJt/UXQ=;
        b=Xt3x4vP7uoZYZHPYiqKRgLTTGkBuXgP4ar6BqkQSrLeq+MBIpKakjslBuZBg409cGt
         Ff60XROlaq84SeGqwsVbfT4qRGj9pUUL2vKuw324jxhEHEzgIYa0skezs4zyJ8JHTGXI
         m8qfngrGkieSHoN583aSdChqA+mVYsHtbocDOF7GeLZEaVIZFPNGDjCZ0OJGJzwGxGL/
         tZrlnphOy27w3oNdsbJwiVE/XHuRotaaLk0NksNNtOZnQDnDurzmFJYU1P5RDQ7EaU7p
         wZ0K+1IrTiQmEKTHR9eFoNZpYmRSymsoqsEy9xbCrncF51ZeHDikrGgZSlqxzx5FOofX
         ep5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770982686; x=1771587486;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nPXtkg0dMes2Y1OatZWLmZe0bpWW6Yg8e2HgVJt/UXQ=;
        b=t9+t6MEwprAVeWA2r7Kge4ItsVmOsTJTE7NSw61aJaRXJ/SfFyFZ95wmRO7DLdOQYq
         /cREDFOToN368ol6LwijI9HBDKcs65LIYUIpXT1CMuGD+BmXO5P7nra8rY8m+cIsrRSd
         zTphduy7NAiTpip0r6sRoiMDGFzY4wa2gM4nvrk8kZvJnEBEQugCU+OWnuiWa4el9Oyb
         Vj+AsoaxFC3875isGZNKLrgtfawekhi5o8TQGC+AufQOAvpAIx3f1E/hjr3UER8qzHFx
         Ixw72v1sekGsbHUwzIBQKJBVNtM2j9Wx6fPc/8O5weATb/XbAteBIVM1/Eo3VcNY43JQ
         Q1eA==
X-Forwarded-Encrypted: i=1; AJvYcCVqTDukl2OwiOR7+iU6Y7Kym3LSiwiKDsILL8//yoEMS+O3L2qQgBFp9pI4uSqdzdgvhTwFi4jjyczJOw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9BDIj8AxB7J5nastxzEwe0wTiuo3xKeDDyA8Awf6etXocxbGe
	vUeSYizKOdzCteAsB8wHHHVq1IrdhMZgCTpvPp0TiXWH/RenlH80l9lWC4vhKvc2ugwtZUdZ1eo
	HSxrejzVqo3K6qa1i9kL2RiNEsxZoGGvcBMA5STgJlySwqE9eaShZhkSIehd6/lRsTw==
X-Gm-Gg: AZuq6aLvzd687NaFleCIRffpBISyFjYMySq9TlM7YdOl6akSaSA54yUePTrAi+9uAKF
	juX2Uh1oxJ0iyND50sZPBHzJrdfTeShsR8SWiiId0B8fObevfdJRcTzpe21mcE1N3rZJSUrtHUm
	TgWLGAwc/+dcdM2boVgQ0A0hzBH0671Bc0C+GPILNW9Eyb4/glgyPPYBewWg5usrVJ53hWgkcLy
	VoFqppz9sDQ5HIlBHdrz/6Rx7sFTwkyMKxKhgGOHPoOT4hZDbfizW1N5/VNQc9O+9WeAkwwoTgX
	wJjVG3T6dCOCtq0PPJHK4QI0Ydfblk7MbPFlz+8tXg5pxASx561FKzz3TtDBIgE06jPV2cKkO6e
	pxMGGhDC/ZeqbgAcwAqUF1ad7swFyWPmV+QQMNrMpOT23/9VDA6ImLJY9aA==
X-Received: by 2002:a17:903:2ec3:b0:2a7:3dbe:353d with SMTP id d9443c01a7336-2ab50617cb4mr15250795ad.53.1770982686139;
        Fri, 13 Feb 2026 03:38:06 -0800 (PST)
X-Received: by 2002:a17:903:2ec3:b0:2a7:3dbe:353d with SMTP id d9443c01a7336-2ab50617cb4mr15250505ad.53.1770982685510;
        Fri, 13 Feb 2026 03:38:05 -0800 (PST)
Received: from [10.217.198.130] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2996503dsm79806985ad.44.2026.02.13.03.38.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 03:38:05 -0800 (PST)
Message-ID: <078a0ab5-0212-452a-957d-f87084127190@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 17:08:00 +0530
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hwmon: Add Qualcomm PMIC BCL hardware monitor driver
To: Bjorn Andersson <andersson@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-2-7b426f0b77a1@oss.qualcomm.com>
 <ndkdgw6tiau4y7psfl53tmzylrfi27h6j5likx5mahufv34625@na3yyn56fgw6>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <ndkdgw6tiau4y7psfl53tmzylrfi27h6j5likx5mahufv34625@na3yyn56fgw6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3apCLxLNvU16lvn94tX9VvWXj6C4Cruc
X-Proofpoint-ORIG-GUID: 3apCLxLNvU16lvn94tX9VvWXj6C4Cruc
X-Authority-Analysis: v=2.4 cv=LNZrgZW9 c=1 sm=1 tr=0 ts=698f0d1e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=aIVcIxTxIAiOnfoqHEoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA4OSBTYWx0ZWRfXwF13mldsJVOu
 sAvsNgBTkl334XOSYWew4etMwPXV1fr4HBQUUfh1tEJoBU41MvuhxmaOSh7oEQg732NWpLq6HSz
 W9b5hAt3CSYjFs8v1kSdNlw55kD4y9zGDnhZkUa/gtRq+5x7dT6L5afFA3VHBvQyC2fedzpzq4r
 1HUxB7RjKh6Zo6tA0Z4ZXbLp4SuBPYAdvjczlzNGf2SXlXgjMdm7W+MGUuQoRU393N5I3BqSM5d
 oMB0YhMQah+7B9bukqGqbcQwVJ3v8E9qKh/ZXYtXGKHbjfQ18bIQVFL+i6DbyuSNA8sWh6Ofw21
 40QPdxf2xiWJwg60I0c16J75XYF8Lpt6zRhEgP0JHQhX98Ecfv+BV1fhkuWcGnbsP4V+7+lWIBn
 t2A25qTSHdKfzgsvBK2cIU7KkELCs4gJ3VILvuUE0nnw1aQlpOlaY/a468zxrq/6StRwyyQJs8P
 IeVM+GoK9MQV5jtZbUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_02,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130089

Hi Bjorn,

On 2/6/2026 6:54 PM, Bjorn Andersson wrote:
> On Fri, Feb 06, 2026 at 02:44:06AM +0530, Manaf Meethalavalappu Pallikunhi wrote:
>> diff --git a/drivers/hwmon/qcom-bcl-hwmon.c b/drivers/hwmon/qcom-bcl-hwmon.c
>> new file mode 100644
>> index 000000000000..a7e3b865de5c
>> --- /dev/null
>> +++ b/drivers/hwmon/qcom-bcl-hwmon.c
>> @@ -0,0 +1,982 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Qualcomm pmic BCL hardware driver for battery overcurrent and
>> + * battery or system under voltage monitor
>> + *
>> + * Copyright (c) 2026, Qualcomm Innovation Center, Inc. All rights reserved.
> That's the wrong statement.
My bad, I copied old copyrights, will update
>
>> + */
>> +
> [..]
>> +static void bcl_hw_channel_mon_init(struct bcl_device *bcl)
>> +{
>> +	bcl->in_mon_enabled = bcl_in_monitor_enabled(bcl);
>> +	bcl->in_input_enabled = bcl_in_input_enabled(bcl);
>> +	bcl->curr_mon_enabled = bcl_curr_monitor_enabled(bcl);
>> +}
>> +
>> +static int bcl_alarm_irq_init(struct platform_device *pdev,
>> +			      struct bcl_device *bcl)
>> +{
>> +	int ret = 0, irq_num = 0, i = 0;
> First use of these three variables are assignments, no need to
> zero-initialize them here.
>
>> +	struct bcl_alarm_data *alarm;
>> +
>> +	for (i = LVL0; i < ALARM_MAX; i++) {
> I would prefer ARRAY_SIZE(bcl->bcl_alarms) over ALARM_MAX.
Ack
>
>> +		alarm = &bcl->bcl_alarms[i];
>> +		alarm->type = i;
>> +		alarm->device = bcl;
>> +
>> +		ret = devm_delayed_work_autocancel(bcl->dev, &alarm->alarm_poll_work,
>> +					   bcl_alarm_enable_poll);
>> +		if (ret)
>> +			return ret;
>> +
>> +		irq_num = platform_get_irq_byname(pdev, bcl_int_names[i]);
>> +		if (irq_num <= 0)
>> +			continue;
>> +
>> +		ret = devm_request_threaded_irq(&pdev->dev, irq_num, NULL,
>> +						bcl_handle_alarm, IRQF_ONESHOT,
>> +						bcl_int_names[i], alarm);
>> +		if (ret) {
>> +			dev_err(&pdev->dev, "Error requesting irq(%s).err:%d\n",
>> +				bcl_int_names[i], ret);
>> +			return ret;
>> +		}
>> +		enable_irq_wake(alarm->irq);
>> +		alarm->irq_enabled = true;
>> +		alarm->irq = irq_num;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int bcl_regmap_field_init(struct device *dev, struct bcl_device *bcl,
>> +				 const struct bcl_desc *data)
>> +{
>> +	int i;
>> +	struct reg_field fields[F_MAX_FIELDS];
>> +
>> +	BUILD_BUG_ON(ARRAY_SIZE(common_reg_fields) != COMMON_FIELD_MAX);
>> +
>> +	for (i = 0; i < data->num_reg_fields; i++) {
>> +		if (i < COMMON_FIELD_MAX)
>> +			fields[i] = common_reg_fields[i];
>> +		else
>> +			fields[i] = data->reg_fields[i];
>> +
>> +		/* Need to adjust BCL base from regmap dynamically */
>> +		fields[i].reg += bcl->base;
>> +	}
>> +
>> +	return devm_regmap_field_bulk_alloc(dev, bcl->regmap, bcl->fields,
>> +					   fields, data->num_reg_fields);
>> +}
>> +
>> +static int bcl_get_device_property_data(struct platform_device *pdev,
>> +				   struct bcl_device *bcl)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	int ret;
>> +	u32 reg;
>> +
>> +	ret = device_property_read_u32(dev, "reg", &reg);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	bcl->base = reg;
>> +
>> +	device_property_read_u32_array(dev, "overcurrent-thresholds-milliamp",
>> +				       bcl->curr_thresholds, 2);
>> +	return 0;
>> +}
>> +
>> +static int bcl_probe(struct platform_device *pdev)
>> +{
>> +	struct bcl_device *bcl;
>> +	int ret;
>> +
>> +	bcl = devm_kzalloc(&pdev->dev, sizeof(*bcl), GFP_KERNEL);
>> +	if (!bcl)
>> +		return -ENOMEM;
>> +
>> +	bcl->dev = &pdev->dev;
>> +	bcl->desc = device_get_match_data(&pdev->dev);
>> +	if (!bcl->desc)
>> +		return -EINVAL;
>> +
>> +	ret = devm_mutex_init(bcl->dev, &bcl->lock);
>> +	if (ret)
>> +		return ret;
>> +
>> +	bcl->regmap = dev_get_regmap(pdev->dev.parent, NULL);
>> +	if (!bcl->regmap) {
>> +		dev_err(&pdev->dev, "Couldn't get parent's regmap\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = bcl_get_device_property_data(pdev, bcl);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = bcl_regmap_field_init(bcl->dev, bcl, bcl->desc);
>> +	if (ret < 0) {
>> +		dev_err(&pdev->dev, "Unable to allocate regmap fields, err:%d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	if (!bcl_hw_is_enabled(bcl))
>> +		return -ENODEV;
>> +
>> +	ret = bcl_curr_thresh_update(bcl);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = bcl_alarm_irq_init(pdev, bcl);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	bcl_hw_channel_mon_init(bcl);
>> +
>> +	dev_set_drvdata(&pdev->dev, bcl);
>> +
>> +	bcl->hwmon_name = devm_hwmon_sanitize_name(&pdev->dev,
>> +						   dev_name(bcl->dev));
>> +	if (IS_ERR(bcl->hwmon_name)) {
>> +		dev_err(&pdev->dev, "Failed to sanitize hwmon name\n");
> Afaict, devm_hwmon_sanitize_name() can only return -ENOMEM, which
> already printed an error.
Ack
>
>> +		return PTR_ERR(bcl->hwmon_name);
>> +	}
>> +
>> +	bcl->hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
>> +							      bcl->hwmon_name,
>> +							      bcl,
>> +							      &bcl_hwmon_chip_info,
>> +							      NULL);
>> +	if (IS_ERR(bcl->hwmon_dev)) {
>> +		dev_err(&pdev->dev, "Failed to register hwmon device: %ld\n",
>> +			PTR_ERR(bcl->hwmon_dev));
>> +		return PTR_ERR(bcl->hwmon_dev);
>> +	}
>> +
>> +	dev_dbg(&pdev->dev, "BCL hwmon device with version: %u.%u registered\n",
>> +		bcl_get_version_major(bcl), bcl_get_version_minor(bcl));
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id bcl_match[] = {
>> +	{
>> +		.compatible = "qcom,bcl-v1",
>> +		.data = &pm7250b_data,
> Why generic compatibles but pmic-specific data structures? If anything
> I'd expect tthe other way around...
Ack, what I thought is, there can be multiple pmics which share same 
data structure in same generation. In that case no need to add extra binding
config,  Just use generic compatibles. By reading  all these comments,  
it shouldn't be like this. I will remove generic compatibles.
>
>> +	}, {
>> +		.compatible = "qcom,bcl-v2",
>> +		.data = &pm8350_data,
>> +	}, {
>> +		.compatible = "qcom,bcl-v3-bmx",
>> +		.data = &pm8550b_data,
>> +	}, {
>> +		.compatible = "qcom,bcl-v3-wb",
>> +		.data = &pmw5100_data,
>> +	}, {
>> +		.compatible = "qcom,bcl-v3-core",
>> +		.data = &pm8550_data,
>> +	}, {
>> +		.compatible = "qcom,bcl-v4-bmx",
>> +		.data = &pmih010_data,
>> +	}, {
>> +		.compatible = "qcom,bcl-v4-wb",
>> +		.data = &pmw6100_data,
>> +	}, {
>> +		.compatible = "qcom,bcl-v4-core",
>> +		.data = &pmh010_data,
>> +	}, {
>> +		.compatible = "qcom,bcl-v4-pmv010",
>> +		.data = &pmv010_data,
>> +	},
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, bcl_match);
>> +
>> +static struct platform_driver bcl_driver = {
>> +	.probe	= bcl_probe,
>> +	.driver	= {
>> +		.name		= BCL_DRIVER_NAME,
>> +		.of_match_table	= bcl_match,
>> +	},
>> +};
>> +
>> +MODULE_AUTHOR("Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>");
>> +MODULE_DESCRIPTION("QCOM BCL HWMON driver");
>> +module_platform_driver(bcl_driver);
> This relates to the bcl_driver declaration, not module properties. So
> move it there.
Ack
>
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/hwmon/qcom-bcl-hwmon.h b/drivers/hwmon/qcom-bcl-hwmon.h
> Why is there a header file, is this going to be accessed by some other
> driver? It mostly contain driver-internal thing, and some helpers that
> won't be useful outside of the driver.
Ack, will move all changes in to driver file
>
>> new file mode 100644
>> index 000000000000..28a7154d9486
>> --- /dev/null
>> +++ b/drivers/hwmon/qcom-bcl-hwmon.h
>> @@ -0,0 +1,311 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) 2026, Qualcomm Innovation Center, Inc. All rights reserved.
> Please fix this one as well. (Or...drop the file)
>
>> + */
>> +
>> +#ifndef __QCOM_BCL_HWMON_H__
>> +#define __QCOM_BCL_HWMON_H__
>> +
>> +#define BCL_DRIVER_NAME			"qcom-bcl-hwmon"
> This belong in the driver...but frankly, you can just put the string
> directly in bcl_driver.driver.name, no need to have a define for it...
Ack
>
> [..]
>> +/**
>> + * bcl_field_enabled - Generic helper to check if a regmap field is enabled
>> + * @bcl: BCL device structure
>> + * @field: Index in bcl->fields[]
>> + *
>> + * Return: true if field is non-zero, false otherwise
>> + */
>> +static inline bool bcl_field_enabled(const struct bcl_device *bcl, enum bcl_fields id)
>> +{
>> +	int ret;
>> +	u32 val = 0;
>> +
>> +	ret = regmap_field_read(bcl->fields[id], &val);
>> +	if (ret)
>> +		return false;
>> +
>> +	return !!val;
>> +}
>> +
>> +#define bcl_in_input_enabled(bcl)	bcl_field_enabled(bcl, F_IN_INPUT_EN)
>> +#define bcl_curr_monitor_enabled(bcl)	bcl_field_enabled(bcl, F_CURR_MON_EN)
>> +#define bcl_in_monitor_enabled(bcl)	bcl_field_enabled(bcl, F_IN_MON_EN)
>> +#define bcl_hw_is_enabled(bcl)		bcl_field_enabled(bcl, F_CTL_EN)
> This whole thing is only used in bcl_hw_channel_mon_init(), just put the
> code in bcl_hw_channel_mon_init().
>
>
> You have a few other regmap_field_*() calls in the driver, I would
> suggest that you just call that directly for these cases as well.
Ack
>
>> +
>> +/**
>> + * bcl_enable_irq - Generic helper to enable alarm irq
>> + * @alarm: BCL level alarm data
>> + */
>> +static inline void bcl_enable_irq(struct bcl_alarm_data *alarm)
>> +{
>> +	if (alarm->irq_enabled)
>> +		return;
> This can't happen, but because you separated this to a helper function
> it's not obvious
Agree, will update in v2
>
> I'd suggest that you inline the remaining 3 lines in the one place where
> this function is called.
Ack
>
>> +	alarm->irq_enabled = true;
>> +	enable_irq(alarm->irq);
>> +	enable_irq_wake(alarm->irq);
>> +}
>> +
>> +/**
>> + * bcl_disable_irq - Generic helper to disable alarm irq
>> + * @alarm: BCL level alarm data
>> + */
>> +static inline void bcl_disable_irq(struct bcl_alarm_data *alarm)
>> +{
>> +	if (!alarm->irq_enabled)
>> +		return;
> This is tricker, because there's a window between
> devm_request_threaded_irq() and the assignment of irq_enabled, where the
> interrupt function might execute and the attempt to bcl_disable_irq()
> will face irq_enabled == 0.
>
> But I don't think that's intentional...
got it, I will synchronize this with per alarm lock in next patch
>
> I think this too would be better to just inline in the one place its'
> being called.

Ack

Thanks,
Manaf
>
> Regards,
> Bjorn
>
>> +	alarm->irq_enabled = false;
>> +	disable_irq_nosync(alarm->irq);
>> +	disable_irq_wake(alarm->irq);
>> +}
>> +
>> +#endif /* __QCOM_BCL_HWMON_H__ */
>>
>> -- 
>> 2.43.0
>>
