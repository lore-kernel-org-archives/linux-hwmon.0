Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:51208 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932211AbdJYWIZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Oct 2017 18:08:25 -0400
Date: Wed, 25 Oct 2017 15:08:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, andrew@aj.id.au,
        "Edward A. James" <eajames@us.ibm.com>
Subject: Re: [prefix=PATCH] drivers: pmbus: core: Prevent calling
 pmbus_set_page with negative page
Message-ID: <20171025220820.GA5297@roeck-us.net>
References: <1508961173-22686-1-git-send-email-eajames@linux.vnet.ibm.com>
 <20171025211234.GA3273@roeck-us.net>
 <6ad453dc-5d89-4ac8-a379-b5cd3a7b1bbd@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ad453dc-5d89-4ac8-a379-b5cd3a7b1bbd@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Oct 25, 2017 at 04:23:01PM -0500, Eddie James wrote:
> 
> 
> On 10/25/2017 04:12 PM, Guenter Roeck wrote:
> >On Wed, Oct 25, 2017 at 02:52:53PM -0500, Eddie James wrote:
> >>From: "Edward A. James" <eajames@us.ibm.com>
> >>
> >>For devices with word data registers, the pmbus core may call read/write
> >>word data functions with a page value of -1, in order to perform the
> >>operation without setting the page. However, the read/write word data
> >>functions accept only unsigned 8-bit page numbers, resulting in setting
> >>a page of 0xFF in this situation. This may result in errors or undefined
> >>behavior of some devices (specifically the ir35221, which allows the
> >>page to be set to 0xFF, but some subsequent operations to read registers
> >>may fail).
> >>
> >Good catch.
> >
> >Subject came off a bit odd.
> >
> >[prefix=PATCH] drivers: pmbus: core: Prevent ...
> >
> >Please use "[PATCH] hwmon: (pmbus/core) Prevent ..."
> 
> Yea I hit = instead of - in "--subject-prefix"...
> 
> >
> >This me wonder if we should move the check into pmbus_set_page()
> >instead.
> >
> >int pmbus_set_page(struct i2c_client *client, int page)
> >{
> >	...
> >	if (page >= 0 && page != data->currpage) {
> >	...
> >}
> >
> >What do you think ?
> 
> Yea that works well too, and reduces the code size. Though I suppose it
> makes the interface slightly less intuitive, as someone might think they can
> pass a value larger than u8. At least for the read/write functions, a
> negative value has a meaning - "don't change the page."
> 
> Up to you, either way. I'm happy to change it.
> 
Let's do it.

Thanks,
Guenter

> Thanks,
> Eddie
> 
> >
> >Thanks,
> >Guenter
> >
> >>Signed-off-by: Edward A. James <eajames@us.ibm.com>
> >>---
> >>  drivers/hwmon/pmbus/pmbus.h      |  4 ++--
> >>  drivers/hwmon/pmbus/pmbus_core.c | 29 ++++++++++++++++++-----------
> >>  2 files changed, 20 insertions(+), 13 deletions(-)
> >>
> >>diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> >>index 4efa2bd..4a16da6 100644
> >>--- a/drivers/hwmon/pmbus/pmbus.h
> >>+++ b/drivers/hwmon/pmbus/pmbus.h
> >>@@ -405,8 +405,8 @@ struct pmbus_driver_info {
> >>  void pmbus_clear_cache(struct i2c_client *client);
> >>  int pmbus_set_page(struct i2c_client *client, u8 page);
> >>-int pmbus_read_word_data(struct i2c_client *client, u8 page, u8 reg);
> >>-int pmbus_write_word_data(struct i2c_client *client, u8 page, u8 reg, u16 word);
> >>+int pmbus_read_word_data(struct i2c_client *client, int page, u8 reg);
> >>+int pmbus_write_word_data(struct i2c_client *client, int page, u8 reg, u16 word);
> >>  int pmbus_read_byte_data(struct i2c_client *client, int page, u8 reg);
> >>  int pmbus_write_byte(struct i2c_client *client, int page, u8 value);
> >>  int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg,
> >>diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> >>index 302f0ae..6d6e030 100644
> >>--- a/drivers/hwmon/pmbus/pmbus_core.c
> >>+++ b/drivers/hwmon/pmbus/pmbus_core.c
> >>@@ -186,13 +186,16 @@ static int _pmbus_write_byte(struct i2c_client *client, int page, u8 value)
> >>  	return pmbus_write_byte(client, page, value);
> >>  }
> >>-int pmbus_write_word_data(struct i2c_client *client, u8 page, u8 reg, u16 word)
> >>+int pmbus_write_word_data(struct i2c_client *client, int page, u8 reg,
> >>+			  u16 word)
> >>  {
> >>  	int rv;
> >>-	rv = pmbus_set_page(client, page);
> >>-	if (rv < 0)
> >>-		return rv;
> >>+	if (page >= 0) {
> >>+		rv = pmbus_set_page(client, page);
> >>+		if (rv < 0)
> >>+			return rv;
> >>+	}
> >>  	return i2c_smbus_write_word_data(client, reg, word);
> >>  }
> >>@@ -219,13 +222,15 @@ static int _pmbus_write_word_data(struct i2c_client *client, int page, int reg,
> >>  	return pmbus_write_word_data(client, page, reg, word);
> >>  }
> >>-int pmbus_read_word_data(struct i2c_client *client, u8 page, u8 reg)
> >>+int pmbus_read_word_data(struct i2c_client *client, int page, u8 reg)
> >>  {
> >>  	int rv;
> >>-	rv = pmbus_set_page(client, page);
> >>-	if (rv < 0)
> >>-		return rv;
> >>+	if (page >= 0) {
> >>+		rv = pmbus_set_page(client, page);
> >>+		if (rv < 0)
> >>+			return rv;
> >>+	}
> >>  	return i2c_smbus_read_word_data(client, reg);
> >>  }
> >>@@ -269,9 +274,11 @@ int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg, u8 value)
> >>  {
> >>  	int rv;
> >>-	rv = pmbus_set_page(client, page);
> >>-	if (rv < 0)
> >>-		return rv;
> >>+	if (page >= 0) {
> >>+		rv = pmbus_set_page(client, page);
> >>+		if (rv < 0)
> >>+			return rv;
> >>+	}
> >>  	return i2c_smbus_write_byte_data(client, reg, value);
> >>  }
> >>-- 
> >>1.8.3.1
> >>
> 
