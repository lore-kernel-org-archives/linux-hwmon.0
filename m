Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB92EB64D8
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Jun 2023 17:51:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbjFVRvK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 22 Jun 2023 13:51:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230038AbjFVRvJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Jun 2023 13:51:09 -0400
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D9241BF5
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Jun 2023 10:51:07 -0700 (PDT)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 5B79F240028
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Jun 2023 19:51:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1687456265; bh=+6f1VuHtXUmr+vGvHMykGs2UQdqXTVjQ8nXf6J+KvuQ=;
        h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:
         Content-Transfer-Encoding:From;
        b=nG0NLctyT+o098AbDglGpvsqp4Gbqnd5lGf1yMnf0Eg9faVJcYcQkcLz33bnFknaW
         rlDM8HCqPq9bMJiG8xZ02YveuH1PL7hJVSyIpx5GoLSVUPIurzyrEd41XqNRBAEBpW
         IjSauCKYRAAMfSzfYaeHZfIspACBnVrMMpQHrfRHh0iXJk2lApt3dmfWzZiMew9WYS
         uYP9aWV5UM4XQk39/56J4GdBpewsEYSM8A4CShKHZZS52rVl47khObV/DkyaoNRAuc
         Qwyid/8RqBiZXP9xBIjyKQ9EQZIxlpexbIQpU6y1ouCfxRs49jI1goycucFupMfpUa
         6uf43JNn4G9uA==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4Qn7G05GDpz6twK;
        Thu, 22 Jun 2023 19:51:04 +0200 (CEST)
Date:   Thu, 22 Jun 2023 17:51:04 +0000
From:   Wilken Gottwalt <wilken.gottwalt@posteo.net>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: corsair-psu: add support for reading PWM
 values and mode
Message-ID: <20230622195104.3f5b5351@posteo.net>
In-Reply-To: <0eeef6b2-9c9c-4b1a-8538-eb8ef5b1d628@roeck-us.net>
References: <ZJSASByXpzoZ0XyH@monster.localdomain>
        <0eeef6b2-9c9c-4b1a-8538-eb8ef5b1d628@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, 22 Jun 2023 10:42:31 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> On Thu, Jun 22, 2023 at 05:09:28PM +0000, Wilken Gottwalt wrote:
> > Also updates the documentation accordingly.
> > 
> > Signed-off-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
> > ---
> > Changes in v2:
> >   - removed cleanup and typo fixes, sticking to feature adding only
> > ---
> 
> Applied to hwmon-next.
> 
> Note: The patch description should describe what the patch does,
> which isn't just "Also updates the documentation accordingly."
> I'll fix that up, but please keep in mind for later.

Thank you. So what is the best practice if the title tells it all? I'm
always a bit uncertain what to add to the body if there is nothing more.
Just repeat it?

greetings,
Will
