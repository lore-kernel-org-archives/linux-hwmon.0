Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2452C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Feb 2022 05:48:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbiBRFs5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Feb 2022 00:48:57 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbiBRFs5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Feb 2022 00:48:57 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 272353D4B1;
        Thu, 17 Feb 2022 21:48:41 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id p11so3909307ils.1;
        Thu, 17 Feb 2022 21:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JkelnnNWFdmlOy0YURyWaxyjcYrMZ7pqMNYxTFdN3zQ=;
        b=D1aB2EWyPDG50+7eK0MQDNi4coUnzbSQDMoYtWPazGXjMV/9OBlL4aTXFXweFJUBLK
         1W4JbcSwwv8BzpKALFuqIxMI3RxJee3imNrmO80mHYwUHIfC6XjkNv2UFZ44Y34yc6HT
         YbbjfReRTGBcjit2/D6vtD6kASy6cN8oLifCQlnqA7DFjW5nvmlRQDXoUVYyBBGqyKkk
         BrkEA1rbznv1io9HgRQGkLmQQKhb+vkbRpb/t4UJrqBbEy+R4DnWQLxRCAV6sb+CRNHi
         Ihx9l4hqC2LDunUue5+ZegU02/GUv0NSAPqD+LsoyCGcdk15jov1wNWwaP2Ei7b9sVPf
         79IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JkelnnNWFdmlOy0YURyWaxyjcYrMZ7pqMNYxTFdN3zQ=;
        b=JtVItqIhuw4Xas97pPMHbcK0b3hfQHX0DPThoBXJz0HFtlm1L3atHN/ZZgu5V86uA3
         Zkl935Wrcb/9vQzkCRVlgwO5Eap5SfXhoZetFQyo3dJ2LA/TGbvZ0WFZdtjibVlwyRXx
         bBe0TsCp1+CChchh+6Xokpb1Trby1ea+R2BIwc6XeIOr+EZdFHpdo/MxMAUJj2XSzdnH
         9s+AgGoczVfAS3giPlL6QmCX/M0mR5rKL0jXpplI1hUapZaoRBpCd0AhqY+TxzJKOUAW
         qrMvNOB36b6LoQHhWzG4+hGOi1dD1pP6QYxY6HMa8A2gIONkuRk+qweLfxYapS8fFW7s
         f1FA==
X-Gm-Message-State: AOAM530VVJxxm7HAVnt4bjpkpEUGNmUUu0lLyerDI60/uS7YzThuNQuS
        2iApcBxgiHZd63FELCsr9YK4HIFkZnv4tqJ8Vx6iGLFgV24=
X-Google-Smtp-Source: ABdhPJwKsPjxWNGiqxndALni5PS9Yb50kfiSvl/lqnSnPBWQNWYknPZRbjTDApbXznajh5T1JvWnc7T5QwvKxRrmnUk=
X-Received: by 2002:a05:6e02:1c26:b0:2be:a5ac:2985 with SMTP id
 m6-20020a056e021c2600b002bea5ac2985mr4231690ilh.125.1645163320584; Thu, 17
 Feb 2022 21:48:40 -0800 (PST)
MIME-Version: 1.0
References: <20220217072340.2472987-1-eugene.shalygin@gmail.com>
 <bf18f96a-b9ee-43f0-8b53-fc7d4aa6cf39@roeck-us.net> <CAB95QASiF=mXcUoBsOwKvtZ8KmVYgNd1bP-5+e0WYifcEzK55w@mail.gmail.com>
 <a8e9e6f1-e7a0-d40d-8065-b72f60c72a32@roeck-us.net> <CAB95QATVnZMQLCU_eTr7=ASVmJ+aYayQGJ0xZ=OtowdhPZQKSw@mail.gmail.com>
 <791af285-ad53-625a-8d3a-2be8d0022c75@roeck-us.net>
In-Reply-To: <791af285-ad53-625a-8d3a-2be8d0022c75@roeck-us.net>
From:   Eugene Shalygin <eugene.shalygin@gmail.com>
Date:   Fri, 18 Feb 2022 06:48:29 +0100
Message-ID: <CAB95QAQegNNJ3H_iXyR3niaeCitZG-FMrWK9mAWEtj+OXE1JFw@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) do not print from .probe()
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, 17 Feb 2022 at 22:25, Guenter Roeck <linux@roeck-us.net> wrote:

> !strcmp(), and, yes, dmi functions can return NULL.

Thanks!

Regards,
Eugene
