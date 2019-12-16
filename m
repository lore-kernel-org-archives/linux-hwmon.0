Return-Path: <SRS0=70Ry=2G=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A6A5C43603
	for <linux-hwmon@archiver.kernel.org>; Mon, 16 Dec 2019 23:27:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 31A4022464
	for <linux-hwmon@archiver.kernel.org>; Mon, 16 Dec 2019 23:27:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MMYzJp6U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbfLPX1Y (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 16 Dec 2019 18:27:24 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:45727 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726717AbfLPX1X (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 16 Dec 2019 18:27:23 -0500
Received: by mail-pj1-f68.google.com with SMTP id r11so3682424pjp.12;
        Mon, 16 Dec 2019 15:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=pP1hagqSYDwwA2YjZ9gfdWx6xDMgnbeyBHGfmn3+DE0=;
        b=MMYzJp6UxQUQNh58RYjrQGcY6a+hdQWcxSmKtC7oHVd0+x7KJpndeE6yPq3xBAl3jZ
         B/MX8003PV+SZ2nwo8AxyMJHjMHWpXKKFZsX3sWY/ZhgsSxWp3VW8rlFk3N5TVHYYYEX
         qpki9caXNC3/QO8osDQ43QRMuA/yh72mDh6umUSu4mOhWTdU8DaM6XUsO20xR7HH/TAY
         lE2AQsIq2ECvmaIM5v3+cWuHGSiTBIqbd/D1GSPw8a4IbTUmHJ1vwbN5KmsKT+zS7PBd
         VmO+ZH5dNK6HKl8B0m1c0D/SeFnNP8WfLnr7i9jiwoQ/Z3YF/c3IFNfjz1CggHZdxXJ0
         rjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=pP1hagqSYDwwA2YjZ9gfdWx6xDMgnbeyBHGfmn3+DE0=;
        b=r13koMdXM5QcK2ko7rc8aO3f6i3j4bG/RNYmjKwYr9UazD+vt4EUmbg7L6pZS25pbj
         DYzjxt2EpyuB+FOZr1sensRFbmfVdF+hB3wMcJb1sO5FHlfzF6e0knCDjXMmnIibGxZr
         wqWwB69JAhAXHBIaek51cq+kQCRgJpN7Eg+5rxhV2zbGfGbaGE5ZaaMyFA0Ya+YVyFOG
         clNDnvtLxmNobVrNAS/RiZPZYep1GDclsKXANIYGfjiqWwGXgYLRc2/Y9j9cLwxpJyuS
         jjt20AfkfHy+iFAJjJBqq4c1yy66IgjmsIi5lXllLXc66OCl8pHVOhw1v9wZ8FuhjG3i
         JKRw==
X-Gm-Message-State: APjAAAWlFxcbXrHYaXqppYT6Xf1tfNN3uI+K+zoHNfq1CJwdihGCb+CP
        CyDa9NybhlKiRoyXEDVUa0g=
X-Google-Smtp-Source: APXvYqxGQ8NGtMEivlA2YMXllL8k/BlL9MhGxi6roCjQUTeTt1nWxWnBdxfsHtWDSc0zFy7zNwVsAA==
X-Received: by 2002:a17:90a:bd8f:: with SMTP id z15mr2370209pjr.54.1576538842771;
        Mon, 16 Dec 2019 15:27:22 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k9sm593648pje.26.2019.12.16.15.27.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Dec 2019 15:27:21 -0800 (PST)
Date:   Mon, 16 Dec 2019 15:27:20 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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
Subject: Re: [PATCH v11 14/14] hwmon: Add PECI dimmtemp driver
Message-ID: <20191216232720.GA17398@roeck-us.net>
References: <20191211194624.2872-1-jae.hyun.yoo@linux.intel.com>
 <20191211194624.2872-15-jae.hyun.yoo@linux.intel.com>
 <d75aaad9-ae07-feeb-966a-899ecfe9d4b3@roeck-us.net>
 <5ed9f292-e024-ffda-a1a8-870ba0f05c58@linux.intel.com>
 <20191216212120.GA12089@roeck-us.net>
 <c6ccb0ff-c0b4-86b2-1768-ba63713034a4@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6ccb0ff-c0b4-86b2-1768-ba63713034a4@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Dec 16, 2019 at 02:17:34PM -0800, Jae Hyun Yoo wrote:
> [...]
> 
> > > > > +static int get_dimm_temp(struct peci_dimmtemp *priv, int dimm_no)
> > > > > +{
> > > > > +    int dimm_order = dimm_no % priv->gen_info->dimm_idx_max;
> > > > > +    int chan_rank = dimm_no / priv->gen_info->dimm_idx_max;
> > > > > +    struct peci_rd_pci_cfg_local_msg rp_msg;
> > > > > +    u8  cfg_data[4];
> > > > > +    int ret;
> > > > > +
> > > > > +    if (!peci_sensor_need_update(&priv->temp[dimm_no]))
> > > > > +        return 0;
> > > > > +
> > > > > +    ret = read_ddr_dimm_temp_config(priv, chan_rank, cfg_data);
> > > > > +    if (ret)
> > > > > +        return ret;
> > > > > +
> > > > > +    priv->temp[dimm_no].value = cfg_data[dimm_order] * 1000;
> > > > > +
> > > > > +    switch (priv->gen_info->model) {
> > > > > +    case INTEL_FAM6_SKYLAKE_X:
> > > > > +        rp_msg.addr = priv->mgr->client->addr;
> > > > > +        rp_msg.bus = 2;
> > > > > +        /*
> > > > > +         * Device 10, Function 2: IMC 0 channel 0 -> rank 0
> > > > > +         * Device 10, Function 6: IMC 0 channel 1 -> rank 1
> > > > > +         * Device 11, Function 2: IMC 0 channel 2 -> rank 2
> > > > > +         * Device 12, Function 2: IMC 1 channel 0 -> rank 3
> > > > > +         * Device 12, Function 6: IMC 1 channel 1 -> rank 4
> > > > > +         * Device 13, Function 2: IMC 1 channel 2 -> rank 5
> > > > > +         */
> > > > > +        rp_msg.device = 10 + chan_rank / 3 * 2 +
> > > > > +                 (chan_rank % 3 == 2 ? 1 : 0);
> > > > > +        rp_msg.function = chan_rank % 3 == 1 ? 6 : 2;
> > > > > +        rp_msg.reg = 0x120 + dimm_order * 4;
> > > > > +        rp_msg.rx_len = 4;
> > > > > +
> > > > > +        ret = peci_command(priv->mgr->client->adapter,
> > > > > +                   PECI_CMD_RD_PCI_CFG_LOCAL, &rp_msg);
> > > > > +        if (rp_msg.cc != PECI_DEV_CC_SUCCESS)
> > > > > +            ret = -EAGAIN;
> > > > > +        if (ret)
> > > > > +            return ret;
> > > > > +
> > > > > +        priv->temp_max[dimm_no] = rp_msg.pci_config[1] * 1000;
> > > > > +        priv->temp_crit[dimm_no] = rp_msg.pci_config[2] * 1000;
> > > > > +        break;
> > > > > +    case INTEL_FAM6_SKYLAKE_XD:
> > > > > +        rp_msg.addr = priv->mgr->client->addr;
> > > > > +        rp_msg.bus = 2;
> > > > > +        /*
> > > > > +         * Device 10, Function 2: IMC 0 channel 0 -> rank 0
> > > > > +         * Device 10, Function 6: IMC 0 channel 1 -> rank 1
> > > > > +         * Device 12, Function 2: IMC 1 channel 0 -> rank 2
> > > > > +         * Device 12, Function 6: IMC 1 channel 1 -> rank 3
> > > > > +         */
> > > > > +        rp_msg.device = 10 + chan_rank / 2 * 2;
> > > > > +        rp_msg.function = (chan_rank % 2) ? 6 : 2;
> > > > > +        rp_msg.reg = 0x120 + dimm_order * 4;
> > > > > +        rp_msg.rx_len = 4;
> > > > > +
> > > > > +        ret = peci_command(priv->mgr->client->adapter,
> > > > > +                   PECI_CMD_RD_PCI_CFG_LOCAL, &rp_msg);
> > > > > +        if (rp_msg.cc != PECI_DEV_CC_SUCCESS)
> > > > > +            ret = -EAGAIN;
> > > > > +        if (ret)
> > > > > +            return ret;
> > > > > +
> > > > > +        priv->temp_max[dimm_no] = rp_msg.pci_config[1] * 1000;
> > > > > +        priv->temp_crit[dimm_no] = rp_msg.pci_config[2] * 1000;
> > > > > +        break;
> > > > > +    case INTEL_FAM6_HASWELL_X:
> > > > > +    case INTEL_FAM6_BROADWELL_X:
> > > > > +        rp_msg.addr = priv->mgr->client->addr;
> > > > > +        rp_msg.bus = 1;
> > > > > +        /*
> > > > > +         * Device 20, Function 0: IMC 0 channel 0 -> rank 0
> > > > > +         * Device 20, Function 1: IMC 0 channel 1 -> rank 1
> > > > > +         * Device 21, Function 0: IMC 0 channel 2 -> rank 2
> > > > > +         * Device 21, Function 1: IMC 0 channel 3 -> rank 3
> > > > > +         * Device 23, Function 0: IMC 1 channel 0 -> rank 4
> > > > > +         * Device 23, Function 1: IMC 1 channel 1 -> rank 5
> > > > > +         * Device 24, Function 0: IMC 1 channel 2 -> rank 6
> > > > > +         * Device 24, Function 1: IMC 1 channel 3 -> rank 7
> > > > > +         */
> > > > > +        rp_msg.device = 20 + chan_rank / 2 + chan_rank / 4;
> > > > > +        rp_msg.function = chan_rank % 2;
> > > > > +        rp_msg.reg = 0x120 + dimm_order * 4;
> > > > > +        rp_msg.rx_len = 4;
> > > > > +
> > > > > +        ret = peci_command(priv->mgr->client->adapter,
> > > > > +                   PECI_CMD_RD_PCI_CFG_LOCAL, &rp_msg);
> > > > > +        if (rp_msg.cc != PECI_DEV_CC_SUCCESS)
> > > > > +            ret = -EAGAIN;
> > > > > +        if (ret)
> > > > > +            return ret;
> > > > > +
> > > > > +        priv->temp_max[dimm_no] = rp_msg.pci_config[1] * 1000;
> > > > > +        priv->temp_crit[dimm_no] = rp_msg.pci_config[2] * 1000;
> > > > > +        break;
> > > > > +    default:
> > > > > +        return -EOPNOTSUPP;
> > > > 
> > > > It looks like the sensors are created even on unsupported platforms,
> > > > which would generate error messages whenever someone tries to read
> > > > the attributes.
> > > > 
> > > > There should be some code early on checking this, and the driver
> > > > should not even instantiate if the CPU model is not supported.
> > > 
> > > Actually, this 'default' case will not be happened because this driver
> > > will be registered only when the CPU model is supported. The CPU model
> > > checking code is in 'intel-peci-client.c' which is [11/14] of this
> > > patch set.
> > > 
> > 
> > That again assumes that both drivers will be modified in sync in the future.
> > We can not make that assumption.
> 
> As you said, both drivers must be modified in sync in the future because
> each Intel CPU family uses different way of reading DIMM temperature.
> In case if supported CPU checking code updated without making sync with
> it, this driver will return the error.
> 

... and in that situation the driver should not instantiate in the
first place. Its probe function should return -ENODEV.

Guenter
