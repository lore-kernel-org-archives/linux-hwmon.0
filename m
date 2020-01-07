Return-Path: <SRS0=assb=24=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21588C33C8C
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jan 2020 13:54:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E75122081E
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jan 2020 13:53:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYwL0EnR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728083AbgAGNx7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Jan 2020 08:53:59 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40341 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727806AbgAGNx7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Jan 2020 08:53:59 -0500
Received: by mail-pf1-f195.google.com with SMTP id q8so28643739pfh.7
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Jan 2020 05:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iqHaxa96RyFjOTihgyTuUN6sH24Uk09XKcXAn6HVeos=;
        b=kYwL0EnRLDh0/iIoc4quSUsJkc9nGihjCuZRtI5RwIXLUnWoKzmGz0WXt8iiZWU/Cx
         h2+vpLpfd+tP5zjZtgy1oank2s5EMlRg9RZf50+BGMXlFi58uw95qod9q/3MxdOWLGAC
         bXgr6kTwcgnZYIgF8n+PADk0hjTQzl20EvHyHAZS2s9dteFMb/X9pzqW3MRNmvSfFGYH
         VeJ6sFFfsvJTvEl7SW0bS74h44q0LWfSLPfOENRRcjJ5vDtWSXrnugiCQ64nvNz3pHtA
         3t5kZf4HX1/LbPNasp5PErvOVgr9LktUpJp/JCM8zZmeAXoE4++NTQM2xkYcj6FPfuPg
         1OSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iqHaxa96RyFjOTihgyTuUN6sH24Uk09XKcXAn6HVeos=;
        b=AF/rSrAeyMVM8WuqnOCqIlRRGWWZBc4t+5ilQhYKKuyl1yArzBP3xq9GTjGEjAE9RF
         o2JzyLup+q/Yyn8Kal7z/D2yC4+tEH/UNZIB5h913a0HxFA87mpZAcUg//Hcdn0QQcX8
         nrMFuUU/YUwwJcFl+a0PvIAsFeTXd0v93Qqe4WFdN91KFLU4j4Uw41FjEaojBvpfNQRg
         hDCFrz77Q8Jdsd6NGMNQNUXx0x2A/IowB2GlScqx4vfiiJizAWxt3Kda61kEI4PsYEA6
         yY98iYoZUziLKoqDCBlTM9wD0hNJ9EEueTl6Rk56icPEPGaTwryFnUvjDpcu69n9ZY1W
         ImSA==
X-Gm-Message-State: APjAAAUcs7tabz+3ceaGHyIzSPQXxv6GLdgek8Lmsvd56ll9tNINkRbk
        PT/glcXpAk/4icFmPN4yhknhjQEl
X-Google-Smtp-Source: APXvYqwdUmkJeSsCz/LyBgdm9RG6GHKtxvX5L5TTEX+0gPGa31f5qO1za2e1/nDU5qS7PeAEFrxeZA==
X-Received: by 2002:aa7:968d:: with SMTP id f13mr111594730pfk.67.1578405238103;
        Tue, 07 Jan 2020 05:53:58 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p16sm66587097pfq.184.2020.01.07.05.53.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2020 05:53:56 -0800 (PST)
Subject: Re: [bug report] hwmon: (pmbus/ibm-cffps) Add new manufacturer
 debugfs entries
To:     Dan Carpenter <dan.carpenter@oracle.com>, eajames@linux.ibm.com
Cc:     linux-hwmon@vger.kernel.org
References: <20200107133235.ug54ssy5bqpg3qp3@kili.mountain>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <a9d596c2-bbbf-02e0-80a0-50cecf6a0665@roeck-us.net>
Date:   Tue, 7 Jan 2020 05:53:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200107133235.ug54ssy5bqpg3qp3@kili.mountain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 1/7/20 5:32 AM, Dan Carpenter wrote:
> Hello Eddie James,
> 
> The patch bb3c0a27ed1d: "hwmon: (pmbus/ibm-cffps) Add new
> manufacturer debugfs entries" from Dec 19, 2019, leads to the
> following static checker warning:
> 
> 	drivers/hwmon/pmbus/ibm-cffps.c:257 ibm_cffps_debugfs_write()
> 	error: uninitialized symbol 'data'.
> 
> drivers/hwmon/pmbus/ibm-cffps.c
>     238  static ssize_t ibm_cffps_debugfs_write(struct file *file,
>     239                                         const char __user *buf, size_t count,
>     240                                         loff_t *ppos)
>     241  {
>     242          u8 data;
>     243          ssize_t rc;
>     244          int *idxp = file->private_data;
>     245          int idx = *idxp;
>     246          struct ibm_cffps *psu = to_psu(idxp, idx);
>     247
>     248          switch (idx) {
>     249          case CFFPS_DEBUGFS_ON_OFF_CONFIG:
>     250                  pmbus_set_page(psu->client, 0);
>     251
>     252                  rc = simple_write_to_buffer(&data, 1, ppos, buf, count);
>                                                      ^^^^^^^^^^^^^^
> If "ppos >= 1" then "data" isn't initialized but "rc" is zero.
> 

If rc == 0 (ie if no data was read) we should probably bail out here (either return
an error or 0).

Guenter

>     253                  if (rc < 0)
>     254                          return rc;
>     255
>     256                  rc = i2c_smbus_write_byte_data(psu->client,
>     257                                                 PMBUS_ON_OFF_CONFIG, data);
>     258                  if (rc)
>     259                          return rc;
>     260
>     261                  rc = 1;
>     262                  break;
>     263          default:
>     264                  return -EINVAL;
>     265          }
>     266
>     267          return rc;
>     268  }
> 
> regards,
> dan carpenter
> 

