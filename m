Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE54EC63798
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Jul 2021 10:13:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 820D661283
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Jul 2021 10:13:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231400AbhGVJcz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 22 Jul 2021 05:32:55 -0400
Received: from foss.arm.com ([217.140.110.172]:49730 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231359AbhGVJcz (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Jul 2021 05:32:55 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1803D106F;
        Thu, 22 Jul 2021 03:13:30 -0700 (PDT)
Received: from bogus (unknown [10.57.79.213])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 673153F73D;
        Thu, 22 Jul 2021 03:13:28 -0700 (PDT)
Date:   Thu, 22 Jul 2021 11:12:29 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Guenter Roeck <linux@roeck-us.net>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/15] dt-bindings: firmware: update arm,scpi.yaml
 reference
Message-ID: <20210722101229.xw35nmfvmfqw5mpk@bogus>
References: <cover.1626947923.git.mchehab+huawei@kernel.org>
 <b5a2b0cb83e7f8193b4be4cef9250dd4c42877ab.1626947923.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5a2b0cb83e7f8193b4be4cef9250dd4c42877ab.1626947923.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jul 22, 2021 at 11:59:59AM +0200, Mauro Carvalho Chehab wrote:
> Changeset 1496be719468 ("dt-bindings: firmware: arm,scpi: Convert to json schema")
> renamed: Documentation/devicetree/bindings/arm/arm,scpi.txt
> to: Documentation/devicetree/bindings/firmware/arm,scpi.yaml.
> 
> Update its cross-reference accordingly.
>

I had forgotten about this document, thanks for fixing again.

Acked-by: Sudeep Holla <sudeep.holla@arm.com>


-- 
Regards,
Sudeep
