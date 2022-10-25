Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99BB5C67871
	for <linux-hwmon@archiver.kernel.org>; Tue, 25 Oct 2022 03:07:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbiJYDHd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Oct 2022 23:07:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbiJYDHc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Oct 2022 23:07:32 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F8AC1F62B
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Oct 2022 20:07:28 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id bp11so18233948wrb.9
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Oct 2022 20:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ur3mzrUVUVKki797YHZDxLS4agZw1B/iJLQcZv5r1cY=;
        b=VjL8+6MjCFks6drTr7Pc6nt3xO/mc93Odq2dHrzRpFy98pteomfjkaFNqbr3alu13W
         b3kt/4icwK4JBHqH4xeHMED8IupTMl8M1Jrj0efloX6NIZ75i2KA8lAdDt6qEJASAU6X
         JGpRyM1G+sS0dOXingXbrYeSaLfDNOv15TpE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ur3mzrUVUVKki797YHZDxLS4agZw1B/iJLQcZv5r1cY=;
        b=H0tRYe/YThzM5tgEzJI8NZXWk+39z/E9WjccydmaeXfI9C4HfXpeuoiCSZHYMIHHJr
         LzQ/oPn/Z200a+JvxI5C0XpuOJRdkk5Uz8HRSgYbuiXu2wpuz0F7oAR7KHwCJ4+XA5f2
         rrd4XYxVuRYvTsbNaIej87FLjqmjYn81NtVB0jiqGZwT4hw+JRm0wQBZwtmET6yJF0Bi
         tD7TpxZiNo1rYOAVWKEb/pMg8OZdZwXpg6J1pcUDXXx8pPXzadBxyVysqIXVyysfEIO+
         XzY3QgXg4h+TXsuwGdKF7brGcSvnVdGmURpNG73z+BDOi9SfPykDQ8wHDlZ59ZDHbPPs
         TOyQ==
X-Gm-Message-State: ACrzQf1YrR3EmGY/c8Y2WQrTh85PflQg6rffXjdfDLtOXE+j1QfHynzH
        lt3TcT31hiajvbY9L+uq3rHpXgWojy5Ld4yKWUB14jNk
X-Google-Smtp-Source: AMsMyM4K8B9zk166VPcolwWG6MfkROeRCzvUnwtIdh39VhrPBpxlzj9NLTGlF9wUd3BLqXxOWU9uJOxDbqEhYDlW5Lc=
X-Received: by 2002:a5d:6c63:0:b0:230:8257:be9e with SMTP id
 r3-20020a5d6c63000000b002308257be9emr22423622wrz.606.1666667246973; Mon, 24
 Oct 2022 20:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <20221024081527.3842565-1-jk@codeconstruct.com.au>
 <20221024113218.GA3800308@roeck-us.net> <525cad90e1e54c7dbf10822f4a755c27a808fc6f.camel@codeconstruct.com.au>
In-Reply-To: <525cad90e1e54c7dbf10822f4a755c27a808fc6f.camel@codeconstruct.com.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Tue, 25 Oct 2022 03:07:15 +0000
Message-ID: <CACPK8Xd5YZt2c7RZmiVbnpFAB3RcrLdu5EdBetY2btn19+03kA@mail.gmail.com>
Subject: Re: [PATCH] hwmon/occ: OCC sensors aren't arch-specific
To:     Jeremy Kerr <jk@codeconstruct.com.au>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        Eddie James <eajames@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, 24 Oct 2022 at 12:51, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> Hi Guenter,
>
> > Should the original patch be reverted instead, and should the revert
> > be backported ? In other words, is this a bug fix which needs to be
> > applied to v6.1, or is it needed for v6.2+ only ?
>
> This isn't a regression, we're just enabling this driver on a new
> hardware implementation. No need to backport either.
>
> I don't think that warrants a revert, as having a separate change means
> we keep the rationale for both changes in the git history.

That makes sense to me.

Acked-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel
