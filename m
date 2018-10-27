Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38255 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728610AbeJ1C03 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 27 Oct 2018 22:26:29 -0400
Date: Sat, 27 Oct 2018 10:44:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org
Subject: Re: [RFC PATCH 7/7] drivers: hwmon: add runtime format string
 checking
Message-ID: <20181027174443.GA31315@roeck-us.net>
References: <20171108223020.24487-1-linux@rasmusvillemoes.dk>
 <20181026232409.16100-1-linux@rasmusvillemoes.dk>
 <20181026232409.16100-8-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181026232409.16100-8-linux@rasmusvillemoes.dk>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi,

On Sat, Oct 27, 2018 at 01:24:09AM +0200, Rasmus Villemoes wrote:
> With -Wformat-nonliteral, gcc complains
> 
> drivers/hwmon/hwmon.c: In function ‘hwmon_genattr’:
> drivers/hwmon/hwmon.c:282:6: warning: format not a string literal, argument types not checked [-Wformat-nonliteral]
>       index + hwmon_attr_base(type));
> 
> Add a runtime check to ensure that the template indeed has a single %d
> printf specifier. Using fmtcheck() also makes gcc verify that the
> expression 'index + hwmon_attr_base(type)' is suitable for %d.
> 
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>

I'll defer to others on this one; let me know if the series is otherwise
accepted. Personally I think that the compiler is at fault here
for not detecting that the format string can not be wrong (since it
is declared and used only in this file), and I find the fmtcheck()
confusing/obfuscating.

Guenter

> ---
>  drivers/hwmon/hwmon.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index 33d51281272b..ec6f5f36b5fc 100644
> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c
> @@ -278,7 +278,8 @@ static struct attribute *hwmon_genattr(struct device *dev,
>  	if (type == hwmon_chip) {
>  		name = (char *)template;
>  	} else {
> -		scnprintf(hattr->name, sizeof(hattr->name), template,
> +		scnprintf(hattr->name, sizeof(hattr->name),
> +			  fmtcheck(template, "type%dwhat", 0),
>  			  index + hwmon_attr_base(type));
>  		name = hattr->name;
>  	}
