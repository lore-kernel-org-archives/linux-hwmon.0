Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl0-f41.google.com ([209.85.160.41]:32946 "EHLO
        mail-pl0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751048AbeGIGho (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 9 Jul 2018 02:37:44 -0400
Received: by mail-pl0-f41.google.com with SMTP id 6-v6so5560220plb.0
        for <linux-hwmon@vger.kernel.org>; Sun, 08 Jul 2018 23:37:44 -0700 (PDT)
Subject: Re: hwmon driver with misc interface
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-hwmon@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
        Eddie James <eajames@linux.vnet.ibm.com>
References: <66a551332b9a458de4ca2f6ed2ee70219179e43e.camel@kernel.crashing.org>
 <c7998d0de444f6b972de2a0a366d509f3e52b639.camel@kernel.crashing.org>
 <9f887b7c-2b6a-1a35-474f-1c83e488dde3@roeck-us.net>
 <0351089598dd12fa9b75a3725cd3c5faa1198f6d.camel@kernel.crashing.org>
 <34ddef1a-3ffa-eb06-65a0-3e1f2b6d4f16@roeck-us.net>
 <03df865c7b351a11b4985c24646423cce2694c53.camel@kernel.crashing.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <023a4783-4625-e6b4-0baf-70292321a71b@roeck-us.net>
Date: Sun, 8 Jul 2018 23:37:40 -0700
MIME-Version: 1.0
In-Reply-To: <03df865c7b351a11b4985c24646423cce2694c53.camel@kernel.crashing.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 07/08/2018 11:04 PM, Benjamin Herrenschmidt wrote:

>> Another option would be to handle it through regmap; That nowadays
>> supports custom accesses implemented in the parent driver (see regmap_read
>> and regmap_write in struct regmap_config). The child driver gets the
>> regmap pointer and uses the regmap API. I don't see that as messy.
> 
> That works for purely MMIO based things, this isn't though.
> 

Sorry, I meant reg_read and reg_write callbacks in struct regmap_config.
I don't think those callbacks are limited to mmio; I find many other
access types by browsing through code providing those callbacks.

Sure, one could consider regmap to be another bloat, but I find it to
be a quite convenient abstraction layer.

Guenter
