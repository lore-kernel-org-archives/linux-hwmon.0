Return-Path: <SRS0=5f14=SZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9593CC282DD
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 17:02:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6281E2148D
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 17:02:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5NzX1Pc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728937AbfDWRCT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Apr 2019 13:02:19 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37889 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727740AbfDWRCT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Apr 2019 13:02:19 -0400
Received: by mail-pl1-f194.google.com with SMTP id f36so7817841plb.5
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Apr 2019 10:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jYTvoZi00AMuX7ktYYMgQWc/Bxd7B0mYXZbCh9lWHX8=;
        b=Y5NzX1PczBdEcNWzoqbezAuqv7+JbycmbbufU7RPh56RiS4rsJ7K1tYOaPAmO4jPmv
         jrWGR2zii+fVF0hwLUab5vHHTu4c3DPfNn1/lc9fqAf1grfpXpOCQdb9zcgjwl376ret
         NB0gNWcBgkmk6ssdsRxzZAIc5RvdK7M4MDAzbBxF3cmtnKfINl8u2qZ1j79Aosfux0V7
         bExcYOlv1DOkQeRRaAKzpLrPy/W6XvQspDHeAEmtt6Mgq0hXklCzCRHifCoa7wRtH1sS
         +tOkWKuz0FIn1SrkY9t3jcC0nf5li55qe6sn+LNr7esG+LgniJSP1mpdTwLiFNWMQ/9m
         fvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=jYTvoZi00AMuX7ktYYMgQWc/Bxd7B0mYXZbCh9lWHX8=;
        b=RO4oPMFBmWCXlpEzOumLs9m0uiOXCILqNqZFcEv/eSBHzOfYWNlRaPwk9LWmPn1oX/
         fGliBcqKZrEGrWxpDSmEXtvUNSPfdF4NmneKemAs8m1rqo83f651Qd9OCQVifCwY9lWJ
         AqDaCYrScKXmq3IJuG3Srim3SqQ1jKIvA/kAbvdNJAHbYDWDvkmGXm5ni/OveYFBPIBf
         xW4hzgAJ1uh94I29MILxAw0NOJId/ipipqRt1J3+A6mteJctTIKndo8rOp+PfsVlubpr
         EGPXorWrxanxJwpd8Cvr5K8KbhuCN/J83H2ZQHMsiwDsTk/177bcdRNDIu81Hc+zXaFw
         PFmA==
X-Gm-Message-State: APjAAAUu0zDdlV6AlQaAw3FNtE/6FZDyJg6z2gTOtRrCg+nc44SWmbTg
        mOC7nDsb7P753sYL2b2G5VqUVv6R
X-Google-Smtp-Source: APXvYqzqAWM+6wzGdHqnGplbS16XszahvOTPx+yCztYQyVEfizIAXAlnaoG35TYlpRH1Idy7or9kOg==
X-Received: by 2002:a17:902:9a83:: with SMTP id w3mr27545813plp.241.1556038938290;
        Tue, 23 Apr 2019 10:02:18 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c25sm24572768pfo.69.2019.04.23.10.02.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Apr 2019 10:02:16 -0700 (PDT)
Date:   Tue, 23 Apr 2019 10:02:14 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 02/11] hwmon: (max6650) Introduce pwm_to_dac and
 dac_to_pwm
Message-ID: <20190423170214.GA28152@roeck-us.net>
References: <1556026391-15360-1-git-send-email-linux@roeck-us.net>
 <1556026391-15360-2-git-send-email-linux@roeck-us.net>
 <EACD4EC3-370C-4369-93A4-364008A04AE5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <EACD4EC3-370C-4369-93A4-364008A04AE5@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Apr 23, 2019 at 11:23:00AM -0400, Jean-Francois Dagenais wrote:
> 
> 
> > On Apr 23, 2019, at 09:33, Guenter Roeck <linux@roeck-us.net> wrote:
> > 
> > -
> > +	dac = pwm_to_dac(pwm, data->config & MAX6650_CFG_V12);
> > +	err = i2c_smbus_write_byte_data(client, MAX6650_REG_DAC, dac);
> > +	if (!err)
> > +		data->dac = dac;
> > 	mutex_unlock(&data->update_lock);
> > 
> > 	return err < 0 ? err : count;
> 
> When I created max6650_set_cur_state, I copied over the pwm1_store code. I ended
> up with a "return err < 0 ? ..." which I adjusted. However, as my colleague
> pointed out, the set_cur_state return style matches that of
> i2c_smbus_write_byte_data so we should simply "return err;" in
> max6650_set_cur_state. Since the driver is in great flux state right now, I
> cannot make a patch only for that and you should probably just include that in
> your series. Or I can submit it later when your series is applied?
> 
Just a patch for that should work; I don't think I changed the code
around it too much. Can you give it a try ?

Guenter
