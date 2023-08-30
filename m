Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05861C83F12
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Aug 2023 02:08:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241661AbjH3CIY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 29 Aug 2023 22:08:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241662AbjH3CIM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Aug 2023 22:08:12 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8BEC1AD
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Aug 2023 19:08:09 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-34deab8010dso4740755ab.3
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Aug 2023 19:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693361289; x=1693966089; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m8q9U0lrJvsfD804B/B6x84iiD69UX7+S8H+PhsFL9M=;
        b=LELlKS8Lzlhx9qFpMdhgVdwkOqgiu7NgKsKG+omHNaibPLTlcEidwzJdq5ActD91cy
         KgJDvcQPOP63Hh5eDLmuc1dc7JsVhj7x7gN0mxA2PqDTscpJc8hBCHGU1v3r8Ug/coeX
         5MjM0syWJcX2OeZcQKBjoFLbE3c5UzfdkYZlyX68ArlIm4UiXZIwvxDZZhLxPP18Qqv0
         UFAZ+0LIz/SRSvdlvFJvSyXanx1J37GYDr1yMXHwasAMkMlR3bWNG5sq4nvGPpOffjvU
         oNySRm09mzQvVg2IPiHZEbz2A7h2LSDFvkzcFtUuA8xUMFm/eR8PhYaFVi2POi9oml3x
         cfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693361289; x=1693966089;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m8q9U0lrJvsfD804B/B6x84iiD69UX7+S8H+PhsFL9M=;
        b=DTpd2hwY+MELZFUnBgza22jgDvpCzOpTZRRT4eag4Uux4mpsHqP3MbqMlF/HtjWUck
         reiL6hW5Yb/j+xMMvY4GLz9NngX6QBn4M2wIhYsTPonIxopQNwNW+Q64ms5GrRu0l3N0
         h0g4MqLoxlxWWO2CLhphg8YqNPDTgtp/ZdxeRfd3OXAz4Ix1+Uq00bVq45xG2geEbp2D
         I77Wkjx5snYsJnIf2ztedXWWCiG/Que9V9nRFBSqFG5/Ba8Yallt2cJ485k8MX1xkcrl
         o/qj0HGN3B3fcjFxxC6AWClTM1+JW+6Es2jD1NzwnvQJg0yEb9mNgtJn9sYqkfzRVEMw
         IdnQ==
X-Gm-Message-State: AOJu0Yw0SxizDZl6CWxzoTyNpf4tmarklIdsmZgZQUsINX7vn80aUSm6
        eJKH4l2O+MHpZbtEfAoX9rg63FbiBzM=
X-Google-Smtp-Source: AGHT+IE5NdjuKa/eKC2qsyHE0t29CD2gKhoEQh+B5SuTNrfViZupB/ECFmem5REuuStbHAKAs7euEA==
X-Received: by 2002:a92:c266:0:b0:34d:f0b4:787a with SMTP id h6-20020a92c266000000b0034df0b4787amr1432812ild.15.1693361288936;
        Tue, 29 Aug 2023 19:08:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g2-20020a02b702000000b004300eca209csm3431740jam.112.2023.08.29.19.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 19:08:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 29 Aug 2023 19:08:07 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Pankaj Pandey <pankaj.embedded@gmail.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: Fwd: Regarding pmbus_core.c
Message-ID: <d41992ac-9670-44af-963b-d171bfcdd8f9@roeck-us.net>
References: <CAOdCjQtTzQpsko+vqkF9zW5RPe1520r4B5kFsJzHjSkK+KxvMw@mail.gmail.com>
 <CAOdCjQv-dCsd_EDnmWN786H57=cN2U8GBZLS96gXme6hfYpC4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOdCjQv-dCsd_EDnmWN786H57=cN2U8GBZLS96gXme6hfYpC4A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Aug 30, 2023 at 07:16:46AM +0530, Pankaj Pandey wrote:
> ---------- Forwarded message ---------
> From: Pankaj Pandey <pankaj.embedded@gmail.com>
> Date: Wed, Aug 30, 2023 at 4:42 AM
> Subject: Regarding pmbus_core.c
> To: <linux@roeck-us.net>
> 
> 
> Hi Guenter Roeck,
> 
> I am facing an issue at drivers/hwmon/pmbus/pmbus_core.c of linux-5.10 kernel.
> I am using the bm454 driver from drivers/hwmon/pmbus/pmbus.c.
> Observed sometimes my Powepc based target board called for reset from
> inside int pmbus_write_byte_data(struct i2c_client *client, int page,
> u8 reg, u8 value)  function.  It is not consistent, sometimes not

Sorry, I don't understand what you mean with "called for reset from
inside int pmbus_write_byte_data". Please clarify.

If I recall correctly, bmr454 is very picky when it comes to i2c bus
speed. If it acts up, you might have some success with picking a different
bus speed.

Thanks,
Guenter

> observed any reset and bmr454 initialized fine.  Please suggest any
> pointers to debug this issue.
> 
> Regards,
> Pankaj Pandey
