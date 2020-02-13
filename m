Return-Path: <SRS0=YVCu=4B=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 570ADC2BA83
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 Feb 2020 16:52:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 259FF206ED
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 Feb 2020 16:52:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JBUM8iQO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727992AbgBMQwh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 13 Feb 2020 11:52:37 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:46614 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727974AbgBMQwh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 Feb 2020 11:52:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=cZxDY29j03egGuOzSuPQnoSmNJqLyVF7ItSFUUkhZwU=; b=JBUM8iQOxjfXJ1NwROkkTtaNtr
        D18QNlb3bk66JbihoyQaT1FstmFmxy12XPJxCgkmek6tDtv8nQE6IQehSHMndaERFY9gLiTUtjUKi
        hlou1G2HBwQG4NKLUihtNCahDHvlxH51yWThLprJ4fo0PpY8Tjjb1w6avcN9p6Saopz6yM6S470fk
        j1U50kASgdWDwP6cPz1xqKenA6I8D9rodhaEt1AD+/cSuMLN71jPvQ9b2q++wAI5Lzf11nOcJ/m1u
        dlp2keYTL6PyAd+05U2Oq6+A9BnuJva7tmJszPh+jzlEe2lUBrwZCt1cLVf1NNJKhTe7KBiXDHjbE
        WqAhdXoA==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j2HjA-0006KS-E9; Thu, 13 Feb 2020 16:52:36 +0000
Subject: Re: [PATCH] docs: hmon: ltc2978.rst: fix a broken table
To:     "Jones, Michael-A1" <Michael-A1.Jones@analog.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <9188836b1ec6744d3d936df8fbfe08f25422879e.1581610553.git.mchehab+huawei@kernel.org>
 <20200213162403.GB16294@roeck-us.net>
 <SN6PR03MB40322F27BA88395ADD0BD5B8F61A0@SN6PR03MB4032.namprd03.prod.outlook.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <92227ac0-44e6-51a7-bbca-5b2b477bc508@infradead.org>
Date:   Thu, 13 Feb 2020 08:52:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <SN6PR03MB40322F27BA88395ADD0BD5B8F61A0@SN6PR03MB4032.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2/13/20 8:38 AM, Jones, Michael-A1 wrote:
> 
> 
> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Thursday, February 13, 2020 9:24 AM
> To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>; Jonathan Corbet <corbet@lwn.net>; Jean Delvare <jdelvare@suse.com>; Jones, Michael-A1 <Michael-A1.Jones@analog.com>; linux-hwmon@vger.kernel.org
> Subject: Re: [PATCH] docs: hmon: ltc2978.rst: fix a broken table
> 
> [External]
> 
> On Thu, Feb 13, 2020 at 05:15:55PM +0100, Mauro Carvalho Chehab wrote:
>> /devel/v4l/docs/Documentation/hwmon/ltc2978.rst:320: WARNING: Malformed table.
>> Text in column margin in table line 80.
>>
>> Cc: Mike Jones <michael-a1.jones@analog.com>
>> Fixes: 6d36d475215a ("hwmon: (pmbus/ltc2978) add support for more parts.")
>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> 
> Sorry, I may have messed that up when trying to fix lines exceeding 
> 80 columns in that file. The problem is already fixed in -next.
> 
> MJ: I would like to know what tool produced the warning so I can run it next time before submission.

Hi,

To see only hwmon docs build, do this (I capture the output to a file;
I also use a separate build dir for DOCS):

$ cd linux-5.6-rc1

$ mkdir -p DOCS

$ make SPHINXDIRS="hwmon" O=DOCS htmldocs 2>&1 | tee dochwmon.out

and then search thru dochwmon.out for files or subjects that
you are interested in.

-- 
~Randy

