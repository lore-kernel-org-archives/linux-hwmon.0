Return-Path: <SRS0=70Ry=2G=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6DFEC43603
	for <linux-hwmon@archiver.kernel.org>; Mon, 16 Dec 2019 22:17:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7C72F24673
	for <linux-hwmon@archiver.kernel.org>; Mon, 16 Dec 2019 22:17:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbfLPWRi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 16 Dec 2019 17:17:38 -0500
Received: from mga07.intel.com ([134.134.136.100]:14406 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726141AbfLPWRh (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 16 Dec 2019 17:17:37 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Dec 2019 14:17:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,323,1571727600"; 
   d="scan'208";a="205261770"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.147]) ([10.7.153.147])
  by orsmga007.jf.intel.com with ESMTP; 16 Dec 2019 14:17:34 -0800
Subject: Re: [PATCH v11 14/14] hwmon: Add PECI dimmtemp driver
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jean Delvare <jdelvare@suse.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jonathan Corbet <corbet@lwn.net>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        "Darrick J . Wong" <darrick.wong@oracle.com>,
        Eric Sandeen <sandeen@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>, Wu Hao <hao.wu@intel.com>,
        Tomohiro Kusumi <kusumi.tomohiro@gmail.com>,
        "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>,
        Frederic Barrat <fbarrat@linux.vnet.ibm.com>,
        "David S . Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Vinod Koul <vkoul@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        David Kershner <david.kershner@unisys.com>,
        Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
        Sagar Dharia <sdharia@codeaurora.org>,
        Johan Hovold <johan@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Juergen Gross <jgross@suse.com>,
        Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
        Tomer Maimon <tmaimon77@gmail.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        openbmc@lists.ozlabs.org, Alan Cox <alan@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jason M Biils <jason.m.bills@linux.intel.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Stef van Os <stef.van.os@prodrive-technologies.com>
References: <20191211194624.2872-1-jae.hyun.yoo@linux.intel.com>
 <20191211194624.2872-15-jae.hyun.yoo@linux.intel.com>
 <d75aaad9-ae07-feeb-966a-899ecfe9d4b3@roeck-us.net>
 <5ed9f292-e024-ffda-a1a8-870ba0f05c58@linux.intel.com>
 <20191216212120.GA12089@roeck-us.net>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <c6ccb0ff-c0b4-86b2-1768-ba63713034a4@linux.intel.com>
Date:   Mon, 16 Dec 2019 14:17:34 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191216212120.GA12089@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

[...]

>>>> +static int get_dimm_temp(struct peci_dimmtemp *priv, int dimm_no)
>>>> +{
>>>> +    int dimm_order = dimm_no % priv->gen_info->dimm_idx_max;
>>>> +    int chan_rank = dimm_no / priv->gen_info->dimm_idx_max;
>>>> +    struct peci_rd_pci_cfg_local_msg rp_msg;
>>>> +    u8  cfg_data[4];
>>>> +    int ret;
>>>> +
>>>> +    if (!peci_sensor_need_update(&priv->temp[dimm_no]))
>>>> +        return 0;
>>>> +
>>>> +    ret = read_ddr_dimm_temp_config(priv, chan_rank, cfg_data);
>>>> +    if (ret)
>>>> +        return ret;
>>>> +
>>>> +    priv->temp[dimm_no].value = cfg_data[dimm_order] * 1000;
>>>> +
>>>> +    switch (priv->gen_info->model) {
>>>> +    case INTEL_FAM6_SKYLAKE_X:
>>>> +        rp_msg.addr = priv->mgr->client->addr;
>>>> +        rp_msg.bus = 2;
>>>> +        /*
>>>> +         * Device 10, Function 2: IMC 0 channel 0 -> rank 0
>>>> +         * Device 10, Function 6: IMC 0 channel 1 -> rank 1
>>>> +         * Device 11, Function 2: IMC 0 channel 2 -> rank 2
>>>> +         * Device 12, Function 2: IMC 1 channel 0 -> rank 3
>>>> +         * Device 12, Function 6: IMC 1 channel 1 -> rank 4
>>>> +         * Device 13, Function 2: IMC 1 channel 2 -> rank 5
>>>> +         */
>>>> +        rp_msg.device = 10 + chan_rank / 3 * 2 +
>>>> +                 (chan_rank % 3 == 2 ? 1 : 0);
>>>> +        rp_msg.function = chan_rank % 3 == 1 ? 6 : 2;
>>>> +        rp_msg.reg = 0x120 + dimm_order * 4;
>>>> +        rp_msg.rx_len = 4;
>>>> +
>>>> +        ret = peci_command(priv->mgr->client->adapter,
>>>> +                   PECI_CMD_RD_PCI_CFG_LOCAL, &rp_msg);
>>>> +        if (rp_msg.cc != PECI_DEV_CC_SUCCESS)
>>>> +            ret = -EAGAIN;
>>>> +        if (ret)
>>>> +            return ret;
>>>> +
>>>> +        priv->temp_max[dimm_no] = rp_msg.pci_config[1] * 1000;
>>>> +        priv->temp_crit[dimm_no] = rp_msg.pci_config[2] * 1000;
>>>> +        break;
>>>> +    case INTEL_FAM6_SKYLAKE_XD:
>>>> +        rp_msg.addr = priv->mgr->client->addr;
>>>> +        rp_msg.bus = 2;
>>>> +        /*
>>>> +         * Device 10, Function 2: IMC 0 channel 0 -> rank 0
>>>> +         * Device 10, Function 6: IMC 0 channel 1 -> rank 1
>>>> +         * Device 12, Function 2: IMC 1 channel 0 -> rank 2
>>>> +         * Device 12, Function 6: IMC 1 channel 1 -> rank 3
>>>> +         */
>>>> +        rp_msg.device = 10 + chan_rank / 2 * 2;
>>>> +        rp_msg.function = (chan_rank % 2) ? 6 : 2;
>>>> +        rp_msg.reg = 0x120 + dimm_order * 4;
>>>> +        rp_msg.rx_len = 4;
>>>> +
>>>> +        ret = peci_command(priv->mgr->client->adapter,
>>>> +                   PECI_CMD_RD_PCI_CFG_LOCAL, &rp_msg);
>>>> +        if (rp_msg.cc != PECI_DEV_CC_SUCCESS)
>>>> +            ret = -EAGAIN;
>>>> +        if (ret)
>>>> +            return ret;
>>>> +
>>>> +        priv->temp_max[dimm_no] = rp_msg.pci_config[1] * 1000;
>>>> +        priv->temp_crit[dimm_no] = rp_msg.pci_config[2] * 1000;
>>>> +        break;
>>>> +    case INTEL_FAM6_HASWELL_X:
>>>> +    case INTEL_FAM6_BROADWELL_X:
>>>> +        rp_msg.addr = priv->mgr->client->addr;
>>>> +        rp_msg.bus = 1;
>>>> +        /*
>>>> +         * Device 20, Function 0: IMC 0 channel 0 -> rank 0
>>>> +         * Device 20, Function 1: IMC 0 channel 1 -> rank 1
>>>> +         * Device 21, Function 0: IMC 0 channel 2 -> rank 2
>>>> +         * Device 21, Function 1: IMC 0 channel 3 -> rank 3
>>>> +         * Device 23, Function 0: IMC 1 channel 0 -> rank 4
>>>> +         * Device 23, Function 1: IMC 1 channel 1 -> rank 5
>>>> +         * Device 24, Function 0: IMC 1 channel 2 -> rank 6
>>>> +         * Device 24, Function 1: IMC 1 channel 3 -> rank 7
>>>> +         */
>>>> +        rp_msg.device = 20 + chan_rank / 2 + chan_rank / 4;
>>>> +        rp_msg.function = chan_rank % 2;
>>>> +        rp_msg.reg = 0x120 + dimm_order * 4;
>>>> +        rp_msg.rx_len = 4;
>>>> +
>>>> +        ret = peci_command(priv->mgr->client->adapter,
>>>> +                   PECI_CMD_RD_PCI_CFG_LOCAL, &rp_msg);
>>>> +        if (rp_msg.cc != PECI_DEV_CC_SUCCESS)
>>>> +            ret = -EAGAIN;
>>>> +        if (ret)
>>>> +            return ret;
>>>> +
>>>> +        priv->temp_max[dimm_no] = rp_msg.pci_config[1] * 1000;
>>>> +        priv->temp_crit[dimm_no] = rp_msg.pci_config[2] * 1000;
>>>> +        break;
>>>> +    default:
>>>> +        return -EOPNOTSUPP;
>>>
>>> It looks like the sensors are created even on unsupported platforms,
>>> which would generate error messages whenever someone tries to read
>>> the attributes.
>>>
>>> There should be some code early on checking this, and the driver
>>> should not even instantiate if the CPU model is not supported.
>>
>> Actually, this 'default' case will not be happened because this driver
>> will be registered only when the CPU model is supported. The CPU model
>> checking code is in 'intel-peci-client.c' which is [11/14] of this
>> patch set.
>>
> 
> That again assumes that both drivers will be modified in sync in the future.
> We can not make that assumption.

As you said, both drivers must be modified in sync in the future because
each Intel CPU family uses different way of reading DIMM temperature.
In case if supported CPU checking code updated without making sync with
it, this driver will return the error.

[...]

>>>> +    ret = create_dimm_temp_info(priv);
>>>> +    if (ret && ret != -EAGAIN) {
>>>> +        dev_err(dev, "Failed to create DIMM temp info\n");
>>>
>>> Does this generate error messages if there are no DIMMS ?
>>
>> Yes, this error message will be printed out once if it meets a timeout
>> in DIMM scanning when there is no DIMM.
>>
> 
> Is that indeed an error, or are there situations where no DIMMs are
> detected and that is a perfectly valid situation ? An error message
> is only acceptable if this is indeed an error in all situations.

If a machine under monitoring has two Intel CPUs installed but only one
CPU has a DIMM, it's also an working configuration although it's an
unusual H/W configuration. I'll fix that to dbg printing.

Thanks,

Jae
