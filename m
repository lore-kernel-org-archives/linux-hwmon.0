Return-Path: <SRS0=SUeP=RA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C7E1C43381
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Feb 2019 15:27:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D0F2920663
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Feb 2019 15:27:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H9ntWb4s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727677AbfBYP1R (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 25 Feb 2019 10:27:17 -0500
Received: from mail-qk1-f170.google.com ([209.85.222.170]:39926 "EHLO
        mail-qk1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727467AbfBYP1P (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Feb 2019 10:27:15 -0500
Received: by mail-qk1-f170.google.com with SMTP id x6so5505506qki.6
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Feb 2019 07:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UJPTUSjzbTvQiWrTZhU7w4PLyrZlFIUdoaSZI/HyKNU=;
        b=H9ntWb4sC5pqeI6t0ZL8WIcLl8PSrqKEeHlNEgEErvHIoFUtxCDERihFeBpiCj0GJt
         gNDxwDDJu6re/zKgx/z47hYL1tumrLKXwqQLyhkmn52w4WEPq1dGTTESJ9onqIPY9FUR
         rUJ6NGgOLCfgdwy+iY0e+Wu2yg+SCN2KWs+jY23Q2dAVLWYe8AXnZWa/ac6YfAvJVnc3
         MydUQDRwaEFRljm4X06sPxbOYGbQfeHitz4Ggljc3LaLQJb0k7jNjiGlnONzMdB0CRq0
         KN3TRcUUmTkUFfx5BjUmGuIXc5SWgW33r0/nZHKjs3Oq4UucFayXcX2jXvsSc0unAsEW
         C2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UJPTUSjzbTvQiWrTZhU7w4PLyrZlFIUdoaSZI/HyKNU=;
        b=qRShgZvf8y/QE4AAsHDAPTCpVf4vVor0YjTXgaUeoZHDLXnkY+Obi6BXhFNIkWFS0A
         l3lKu9zAtaXPiTSCOUWULEwuWN6R4WquJXvy6CmIBK1OqGZYojo6mMDRL5ArxwYJYrIP
         ilaTRo/ibYIyCnadS3ITT7qPTvClSQsWzXL9HFmgmI6fwVT+abHdCJ/6kfXrzS5p2Xc8
         padb+dlMK/p85pJ4PvuUaASCpKfjFOZ73rUTbWVOppGvXVikNZxyTGbOWIQhL6suNwDr
         O/G4zancptNhDz8O/frwiZiu/F+hZ8K0tWDt4BvJmctBliFeM0L3AEWJMQLh6nJ3J6C1
         1fXQ==
X-Gm-Message-State: AHQUAub3ffxTFad0FAo1CGGt+2vdAV9CQTrAqZ2EYRkz/s48eYJmrk21
        jlzSOSRA+645ghok0FUah9T/jrwfSSp9J833KKkK4Q==
X-Google-Smtp-Source: AHgI3IZoOOFmQRu8VCNCVKJ4dgLSLthkuR0c4UpC7SNpLAUjj0zbdfv5085iibIZtEpmEcI11EUzwnQuu/uQCGY8qCE=
X-Received: by 2002:a37:a556:: with SMTP id o83mr13749670qke.78.1551108434881;
 Mon, 25 Feb 2019 07:27:14 -0800 (PST)
MIME-Version: 1.0
References: <201902252359.6qjnq0C3%fengguang.wu@intel.com>
In-Reply-To: <201902252359.6qjnq0C3%fengguang.wu@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 Feb 2019 16:26:56 +0100
Message-ID: <CACRpkdZHqX6qXFp1AzyVpfXmqL_YyKaCVYXy_f_ij=u9ApKPKQ@mail.gmail.com>
Subject: Re: [hwmon:hwmon-next 88/88] FATAL: drivers/hwmon/ad7418: struct
 of_device_id is not terminated with a NULL entry!
To:     kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@01.org, linux-hwmon@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Feb 25, 2019 at 4:08 PM kbuild test robot <lkp@intel.com> wrote:

> >> FATAL: drivers/hwmon/ad7418: struct of_device_id is not terminated with a NULL entry!

Grrr why do I always do this silly mistake. Sorry :(

Guenther, could you poke in a {} as last element of
ad7418_dt_ids[] or would you like me to send a v2?

Yours,
Linus Walleij
