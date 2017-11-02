Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-db5eur01on0118.outbound.protection.outlook.com ([104.47.2.118]:45088
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S932954AbdKBQR2 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 2 Nov 2017 12:17:28 -0400
Subject: Re: [PATCH] pmbus: added possibility to change timeout for device
 update
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20171102113116.14791-1-romain.porte@nokia.com>
 <6d1bc013-52ef-ffd6-52c7-5dac6c8d1e9c@roeck-us.net>
From: Romain Porte <romain.porte@nokia.com>
Message-ID: <cf1535cf-7a76-6d4d-a23f-72077db821ac@nokia.com>
Date: Thu, 2 Nov 2017 17:17:21 +0100
MIME-Version: 1.0
In-Reply-To: <6d1bc013-52ef-ffd6-52c7-5dac6c8d1e9c@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 02/11/2017 14:58, Guenter Roeck wrote:
> NACK, I'd rather drop the caching entirely, and possibly convert the 
> driver to
> regmap for caching non-volatile registers.
I need to familiarize myself with regmap then, it looks like a nice 
abstraction to have.

Do you think I can propose an intermediate patch for removing the cache 
support? (both time-based and data->valid based, so that every read 
actually performs a read, everytime)

Romain.
