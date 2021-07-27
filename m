Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AAF4C4338F
	for <linux-hwmon@archiver.kernel.org>; Tue, 27 Jul 2021 11:26:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E47661527
	for <linux-hwmon@archiver.kernel.org>; Tue, 27 Jul 2021 11:26:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236437AbhG0L0E (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 27 Jul 2021 07:26:04 -0400
Received: from mail.hostpark.net ([212.243.197.30]:36594 "EHLO
        mail.hostpark.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236320AbhG0L0D (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 27 Jul 2021 07:26:03 -0400
X-Greylist: delayed 559 seconds by postgrey-1.27 at vger.kernel.org; Tue, 27 Jul 2021 07:26:02 EDT
Received: from localhost (localhost [127.0.0.1])
        by mail.hostpark.net (Postfix) with ESMTP id C000A163CB;
        Tue, 27 Jul 2021 13:16:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=elsoft.ch; h=
        content-transfer-encoding:content-type:content-type:in-reply-to
        :mime-version:user-agent:date:date:message-id:organization:from
        :from:references:subject:subject:received:received; s=sel2011a;
         t=1627384600; bh=nnN5lZfFj9MppOjkb9i1D7D+MJTulP6KsKyauxX4sGo=; b=
        eESr91MaPfXJrnskyOyzLqbm1XhuG04+D86JOWAVA9IL+sGz+lm0QWKyU4w/uMqN
        UtKagNjJkDUuFIxWMwQ4LjBgm83pypHT4iXjnISq80yy/DmbNIiNBbLiJjvo2pto
        ATTm0dxI5+bH/WdJaLzFKkDefW0DncAPjodyFFWUTSk=
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
        by localhost (mail1.hostpark.net [127.0.0.1]) (amavisd-new, port 10224)
        with ESMTP id b9k2yq6cDK1n; Tue, 27 Jul 2021 13:16:40 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
        by mail.hostpark.net (Postfix) with ESMTPA id 3348E164A0;
        Tue, 27 Jul 2021 13:16:40 +0200 (CEST)
Subject: Re: [PATCH 10/14] peci: Add peci-cpu driver
To:     Iwona Winiarska <iwona.winiarska@intel.com>,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Cc:     linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Ingo Molnar <mingo@redhat.com>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
        Tony Luck <tony.luck@intel.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yazen Ghannam <yazen.ghannam@amd.com>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-11-iwona.winiarska@intel.com>
From:   =?UTF-8?Q?David_M=c3=bcller_=28ELSOFT_AG=29?= <d.mueller@elsoft.ch>
Openpgp: preference=signencrypt
Organization: ELSOFT AG
Message-ID: <26dbd0d3-c326-96a5-2ec7-4fc3387865e9@elsoft.ch>
Date:   Tue, 27 Jul 2021 13:16:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0
 SeaMonkey/2.49.5
MIME-Version: 1.0
In-Reply-To: <20210712220447.957418-11-iwona.winiarska@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Iwona Winiarska wrote:

> +static const struct peci_device_id peci_cpu_device_ids[] = {
> +	{ /* Haswell Xeon */
> +		.family	= 6,
> +		.model	= INTEL_FAM6_HASWELL_X,
> +		.data	= "hsx",
> +	},
> +	{ /* Broadwell Xeon */
> +		.family	= 6,
> +		.model	= INTEL_FAM6_BROADWELL_X,
> +		.data	= "bdx",
> +	},
> +	{ /* Broadwell Xeon D */
> +		.family	= 6,
> +		.model	= INTEL_FAM6_BROADWELL_D,
> +		.data	= "skxd",

I think this should read "bdxd" as "skxd" does not exist in the
cputemp/dimmtemp drivers.
