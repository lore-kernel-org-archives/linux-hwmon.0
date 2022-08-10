Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55BD9C00140
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Aug 2022 16:57:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232685AbiHJQ5F (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 10 Aug 2022 12:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232184AbiHJQ5F (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Aug 2022 12:57:05 -0400
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D3E52D1D0
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Aug 2022 09:57:02 -0700 (PDT)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout01.posteo.de (Postfix) with ESMTPS id AEB8D240027
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Aug 2022 18:57:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1660150620; bh=1O+saA+RO333tBIlQHbodRBUTU7Qknox3og0fEHKBoI=;
        h=Date:From:To:Cc:Subject:From;
        b=g6TI6O+IIAg2wi/xnH3jZx60SadPTyFM3Jejgd25EMs2VH+oJ2vDsElIHiZV2OQAy
         eA8GGl6i3QLmGmALVM1QJeB5f/s4OCFvC/Hqjg0FbC1pKoTIRff3j9ImPTEkgEL8hG
         6ADkv96agRWals9drjs5PHNvNbahwdA0pcwkCMP7NTXccgGAgoWkuOFjFt1cHRWmw8
         jEPUeO+4dycklw05KxF7ashncD7WVq9sgjnC0olQ9y14no5zqtB4ctp6GuPTQKUE8Y
         tsUkjsPd2cAmo5mSqddI/bwj9f0Uudn2H3SX5TK4sLyCU/00GX/gaQpZtOB6HKQtPM
         k2po3c97KmG1w==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4M2x1R42Hhz6tnx;
        Wed, 10 Aug 2022 18:56:59 +0200 (CEST)
Date:   Wed, 10 Aug 2022 16:56:58 +0000
From:   Wilken Gottwalt <wilken.gottwalt@posteo.net>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: corsair-psu: add reporting of rail mode via
 debugfs
Message-ID: <20220810185658.6e27d9bd@posteo.net>
In-Reply-To: <ace70782-777f-ab7c-d190-735f5c65a5e4@roeck-us.net>
References: <YvO4cfx12Q9gcmPg@monster.localdomain>
        <ace70782-777f-ab7c-d190-735f5c65a5e4@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 10 Aug 2022 09:31:21 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> On 8/10/22 06:53, Wilken Gottwalt wrote:
> > Add reporting if the PSU is running in single or multi rail mode via
> > ocpmode debugfs entry. Also update the documentation accordingly.
> > 
> > Signed-off-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
> > ---
> > Changes in v2:
> >    - fixed spelling issues in commit message
> 
> You did not address or even provide feedback on my second comment.

Oh darn ... sorry, I was quite busy and didn't really pay attention. I will
answer the earlier mail and think about it.

Though, maybe you can help me with that what keeps me so busy. Would it be okay
to use a kthread in a hwmon driver to do sampling (500ms - 10s) in conjunction
with HWMON_C_UPDATE_INTERVAL, or is this a strict no-no? I know it is actually
used to set a sample/update rate in a sensor (-register), but this USB-HID
approach is a pure polling thing. It seems to work quite and enables the driver
to collect data quite early in the boot process.

greetings
