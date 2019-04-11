Return-Path: <SRS0=Is7H=SN=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57BCEC10F13
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Apr 2019 11:03:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 309622133D
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Apr 2019 11:03:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbfDKLDk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 11 Apr 2019 07:03:40 -0400
Received: from mx2.suse.de ([195.135.220.15]:44654 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726121AbfDKLDk (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 11 Apr 2019 07:03:40 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 8DED0AC6B;
        Thu, 11 Apr 2019 11:03:39 +0000 (UTC)
Date:   Thu, 11 Apr 2019 13:03:38 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 1/2] hwmon: (occ) Move common code to a separate
 module
Message-ID: <20190411130338.4eabeaf8@endymion>
In-Reply-To: <cc624b5c-f6c5-adb2-7709-f2fc5d851562@linux.ibm.com>
References: <20190410124726.2d7e9d38@endymion>
        <cc624b5c-f6c5-adb2-7709-f2fc5d851562@linux.ibm.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 10 Apr 2019 13:02:32 -0500, Eddie James wrote:
> On 4/10/19 5:47 AM, Jean Delvare wrote:
> > Instead of duplicating the common code into the 2 (binary) drivers,
> > move the common code to a separate module. This is cleaner.
> >
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > Cc: Eddie James <eajames@linux.ibm.com>
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > ---
> > Eddie, can you please give it a try and confirm it works?  
> 
> 
> Yes, this works well.
> 
> Reviewed-by: Eddie James <eajames@linux.ibm.com>
> 
> Tested-by: Eddie James <eajames@linux.ibm.com>

Thanks. Can you please send a patch on top of that updating the help
texts in Kconfig to explain that the drivers are for the BMC and not
for the PowerPC host OS, as discussed before?

Thanks,
-- 
Jean Delvare
SUSE L3 Support
