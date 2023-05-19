Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74A3AC77B75
	for <linux-hwmon@archiver.kernel.org>; Fri, 19 May 2023 13:30:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbjESNaq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 19 May 2023 09:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231589AbjESNan (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 19 May 2023 09:30:43 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43F8A10FA
        for <linux-hwmon@vger.kernel.org>; Fri, 19 May 2023 06:30:17 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-64ab2a37812so605618b3a.1
        for <linux-hwmon@vger.kernel.org>; Fri, 19 May 2023 06:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684502989; x=1687094989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3SJZdpXFnFhebNso7WhlMDXDF29Wj2kASnBat0SRnGM=;
        b=V7rlmkP7YXDgVTkbbBGty0bv49uNdBusC41NTKn9BE879K1rgmWMrgtkD8BXDIfdbw
         CHIf0+TbbOW4FAteqre7WPgir6d2m6qZ4K3CCGFVKYTCMs78xw3VB6F33y6G+aFz/eiA
         NvuFLKj+WV4sr3IQci7bZIczQi5mzZEECIoriS4aTAF2cIFGLLXoVXm5OOtF1uCCk3Dk
         VRV/3bdOERpxiWH5kEhWzSvDfevl0cKrN1GZoRP81dzxr7fgGfWvs8lqJUUGxbAqDiwr
         Uvflz9bnHI9F1LiNH0M1DQB0nEWutAQIn3vWWPdNBwiqg4Ozeh+0mBSJtCC9iqeCo9qV
         DTGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684502989; x=1687094989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3SJZdpXFnFhebNso7WhlMDXDF29Wj2kASnBat0SRnGM=;
        b=JcuYwpfIGqiUtKCQhKegHcqNqDNlzdyVXLcQ4Q59KyEt7WmQquICvjAL+q3g17DvR7
         +v7CCKCivyIhfkmU7+G4C9Q4F0vbj822pt6oGuYPid0k0qvwHGDIEb3yVsAiVSr0jKCH
         bqiF0tIyvDFjhAARd6pGeJlOZduzmSuX7uoruX9s6h7YfkcwnMp0MCGSO5dJikzQlvqB
         1BI2zavpyLBnxHgCHuuLfpUnm/8WEmxd5bg7P9+FnJpFnO4/dMF7DUnal8lwU3Mv5Fbd
         soKXBH21Ym/7HGsMXwNppN0bnoDsdlstn0X9XXdDZV7M2dsnjApKDRFdt9oBOUo7kjPj
         MsQg==
X-Gm-Message-State: AC+VfDy0sNGpm5BlJ7COeo7qo3JChQT6iy1/I4CmjKo7vQTnMsBZjhyg
        xsWrRmCgkcnGBMSmAdO1/pAeXrAPQHQ=
X-Google-Smtp-Source: ACHHUZ6sfklynfqzH02OnwCD2jG56327t3Xx9NBDHySE3Ve1cTY+Ws81fDchxywguY+vj2T8tEG3nw==
X-Received: by 2002:a17:90a:1116:b0:250:69de:7157 with SMTP id d22-20020a17090a111600b0025069de7157mr6645846pja.2.1684502989349;
        Fri, 19 May 2023 06:29:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n15-20020a17090a4e0f00b002367325203fsm1431900pjh.50.2023.05.19.06.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 06:29:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 19 May 2023 06:29:47 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Kirill Yatsenko <kiriyatsenko@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, delvare@suse.com, jcdra1@gmail.com
Subject: Re: [PATCH 1/3] hwmon: (aht10) Fix typos in comments
Message-ID: <fbfbb3c1-0e97-475f-9822-14e4e9a48bfa@roeck-us.net>
References: <20230511202633.299174-1-kiriyatsenko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230511202633.299174-1-kiriyatsenko@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, May 11, 2023 at 10:26:31PM +0200, Kirill Yatsenko wrote:
> Fix typos in the description of the return value section of the
> functions. The word 'succesfull' is incorrect, it should be 'successful'.
> 
> Signed-off-by: Kirill Yatsenko <kiriyatsenko@gmail.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/aht10.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/aht10.c b/drivers/hwmon/aht10.c
> index b8fe3f7248ba..87a433e570e1 100644
> --- a/drivers/hwmon/aht10.c
> +++ b/drivers/hwmon/aht10.c
> @@ -80,7 +80,7 @@ struct aht10_data {
>  /**
>   * aht10_init() - Initialize an AHT10 chip
>   * @data: the data associated with this AHT10 chip
> - * Return: 0 if succesfull, 1 if not
> + * Return: 0 if successful, 1 if not
>   */
>  static int aht10_init(struct aht10_data *data)
>  {
> @@ -124,7 +124,7 @@ static int aht10_polltime_expired(struct aht10_data *data)
>  /**
>   * aht10_read_values() - read and parse the raw data from the AHT10
>   * @data: the struct aht10_data to use for the lock
> - * Return: 0 if succesfull, 1 if not
> + * Return: 0 if successful, 1 if not
>   */
>  static int aht10_read_values(struct aht10_data *data)
>  {
