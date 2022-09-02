Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1026CC001B5
	for <linux-hwmon@archiver.kernel.org>; Fri,  2 Sep 2022 17:18:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235710AbiIBRSm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 2 Sep 2022 13:18:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234963AbiIBRSl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 2 Sep 2022 13:18:41 -0400
Received: from vorpal.se (vorpal.se [IPv6:2a01:7e00::f03c:91ff:fe73:398e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE6F21151B7;
        Fri,  2 Sep 2022 10:18:39 -0700 (PDT)
Received: by vorpal.se (Postfix) with ESMTPSA id 22DEB142D4;
        Fri,  2 Sep 2022 17:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vorpal.se; s=2019;
        t=1662139117; bh=DjSd4kSuTsFRl7nABnQE8EUqNlXBFwLDuMwx6RmVyGs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=RzOdlxTo8sUHpsvfIp7JmORUqjsL4z/NEEmQXL35VCn4ZSMPDAWyQgul2+yCNlyax
         KmZe/FJdqQxbaErPd+gfcgoi+AWGselrn/fvXv/mSX8ynfR9zywTH4lUBd1rXCfjlZ
         zL15HrnoQBjql4/06S0iYUfAFVIM8P5jdvCP4p8I1IyNUr663Es/XH/gl7AFdg9Lus
         dvwHgGMEdwsWgsWy3qMMOQxprNFaBggVP04f1OUwOZFfr0knUZDr/5HDdTPadUVY7D
         5oMpvf6R1ChSeEw1rx1aYEkuTfEL1pYcewVPbw7zaKBKbR/AIcLLcx6ivawQittNDB
         wZa4ShY+L04ig==
Message-ID: <139e7c94-157a-d7f9-7ec1-eea2b5375ee1@vorpal.se>
Date:   Fri, 2 Sep 2022 19:18:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 2/2] platform/x86: toshiba_acpi: Add fan RPM reading
 (hwmon interface)
To:     Hans de Goede <hdegoede@redhat.com>,
        Guenter Roeck <linux@roeck-us.net>,
        platform-driver-x86@vger.kernel.org
Cc:     Azael Avalos <coproscefalo@gmail.com>, linux-hwmon@vger.kernel.org
References: <20220901215819.1608723-1-lkml@vorpal.se>
 <20220901215819.1608723-3-lkml@vorpal.se>
 <0e31840d-aaf3-d2fb-f490-848e30f626a8@roeck-us.net>
 <891c2cd5-cacc-f19d-0334-0186d37b9bd2@redhat.com>
Content-Language: en-US
From:   Arvid Norlander <lkml@vorpal.se>
In-Reply-To: <891c2cd5-cacc-f19d-0334-0186d37b9bd2@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 2022-09-02 10:29, Hans de Goede wrote:
> Hi Guenter, Arvid,
<snip>
> 
> Actually that should be IS_ENABLED since you suggested that
> Arvid should use:
> 
> 	depends on HWMON || HWMON = n
> 
> In the Kconfig bit there is no need for IS_REACHABLE,
> note IS_REACHABLE will work too but I generally prefer
> to avoid it because cases which actually need it lead
> to weirdness where e.g. both HWMON and TOSHIBA_ACPI are
> enabled yet TOSHIBA_ACPI will still not have HWMON
> support.
> 
> Arvid, sorry about the "noise" here, let me try to
> explain.
> 
> First of all lets explain this bit of magic:
> 
> 	depends on HWMON || HWMON = n
> 
> What this says is that if HWMON is enabled it must
> be able to satisfy dependencies on it in toshiba_acpi.c
> (or it may also be fully disabled).
> 
> This magic is necessary to avoid a case where
> toshiba_acpi gets build into the kernel, but the
> hwmon code is a module. In that case linking errors
> (unresolved hwmon symbols) will happen when building
> the main vmlinuz kernel image.
> 
> So basically what this does is if HWMON is configured
> as a module, it limits the choices for TOSHIBA_ACPI
> to either n or m and disallows y.
> 
> I hope that so far I'm making sense...

Thanks, this clears up quite a bit of confusion.

> 
> So now to the #ifdef-ery. Since HWMON can be a module
> when enabled the #define's from Kconfig will either
> contain:
> 
> #define CONFIG_HWMON 1   // when builtin, HWMON=y
> 
> or:
> 
> #define CONFIG_HWMON_MODULE 1   // when a module, HWMON=m
> 
> So you would need to write:
> 
> #if defined CONFIG_HWMON || defined CONFIG_HWMON_MODULE
> 
> as a condition
> 
> #if IS_ENABLED(CONFIG_HWMON)
> 
> is a shorthand (macro) for this.
> 
> ###
> 
> Now back to:
> 
> #if IS_REACHABLE(CONFIG_HWMON)
> 
> This is a special macro for when your Kconfig bit would just be:
> 
> 	depends on HWMON
> 
> in that case TOSHIBA_ACPI might be set to builtin (y)
> while the HWMON core/class code is a module. As mentioned
> above that would lead to undefined hwmon symbols when
> using "#if IS_ENABLED(CONFIG_HWMON)" as test. IS_REACHABLE
> is special in that it will disable (evaluate to false)
> in the case where the code being build is builtin and
> the dependency is a module.
> 
> But that cannot happen here because your Kconfig bit is:
> 
> 	depends on HWMON || HWMON = n
> 
> So "#if IS_ENABLED(CONFIG_HWMON)" is sufficient.
> 
> TL;DR: please use "#if IS_ENABLED(CONFIG_HWMON)" to test
> if the hwmon code should be build.
> 
> Regards,
> 
> Hans

All of this will be useful to know in the future as well I imagine, so
thanks again.

<snip>

Best regards,
Arvid Norlander
