Return-Path: <SRS0=QcRA=ZS=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E36C7C432C0
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Nov 2019 10:03:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B70CD20748
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Nov 2019 10:03:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727585AbfKZKDb convert rfc822-to-8bit (ORCPT
        <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 Nov 2019 05:03:31 -0500
Received: from skedge04.snt-world.com ([91.208.41.69]:36214 "EHLO
        skedge04.snt-world.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727557AbfKZKDb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Nov 2019 05:03:31 -0500
Received: from sntmail10s.snt-is.com (unknown [10.203.32.183])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by skedge04.snt-world.com (Postfix) with ESMTPS id D2F6567A6F2;
        Tue, 26 Nov 2019 11:03:28 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail10s.snt-is.com
 (10.203.32.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 26 Nov
 2019 11:03:28 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Tue, 26 Nov 2019 11:03:28 +0100
From:   Gilles Buloz <Gilles.Buloz@kontron.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: hwmon: (nct7802) buggy VSEN1/2/3 alarm
Thread-Topic: hwmon: (nct7802) buggy VSEN1/2/3 alarm
Thread-Index: AQHVo5IpgkKRfgHMQkil/fmfzLEhKaeb4hMAgAAlS4CAAA46AIAACIgAgAELdoA=
Date:   Tue, 26 Nov 2019 10:03:28 +0000
Message-ID: <5DDCF86F.7010703@kontron.com>
References: <5DDBD386.4070408@kontron.com>
 <6cde95e5-0ab3-016f-b67d-73db8c16ff71@roeck-us.net>
 <5DDC04FB.1030705@kontron.com> <20191125173538.GA21072@roeck-us.net>
 <5DDC1812.9080009@kontron.com>
In-Reply-To: <5DDC1812.9080009@kontron.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux i686; rv:24.0) Gecko/20100101
 Thunderbird/24.1.1
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <598209D2D9149D42BE41C400CB9107F2@snt-world.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: D2F6567A6F2.AEB6F
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: gilles.buloz@kontron.com
X-SnT-MailScanner-To: linux-hwmon@vger.kernel.org, linux@roeck-us.net
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

I have a functional patch (see below), but before going further (split and cleanup), I would like to have your opinion on how the 
NCT7802Y handles the thresholds status.
Except for temperatures and in "comparator interrupt mode", the status bits are NOT set after each ADC conversion, but only once 
when crossing a threshold. So an alarm for a threshold is reported only to the first process reading the status and not to the others.
For instance if you run "sensors" you only get "ALARM" once the nothing until the threshold is crossed again in the other direction. 
Maybe the expected behaviour would be to display "ALARM" as long as we are outside the thresholds, not only once.

--- nct7802.c.orig    2019-11-25 22:17:04.845718422 +0100
+++ nct7802.c    2019-11-25 23:22:00.905387154 +0100
@@ -32,8 +32,8 @@
  static const u8 REG_VOLTAGE[5] = { 0x09, 0x0a, 0x0c, 0x0d, 0x0e };

  static const u8 REG_VOLTAGE_LIMIT_LSB[2][5] = {
-    { 0x40, 0x00, 0x42, 0x44, 0x46 },
-    { 0x3f, 0x00, 0x41, 0x43, 0x45 },
+    { 0x46, 0x00, 0x40, 0x42, 0x44 },
+    { 0x45, 0x00, 0x3f, 0x41, 0x43 },
  };

  static const u8 REG_VOLTAGE_LIMIT_MSB[5] = { 0x48, 0x00, 0x47, 0x47, 0x48 };
@@ -60,6 +60,9 @@
  #define REG_CHIP_ID        0xfe
  #define REG_VERSION_ID        0xff

+#define REG_CACHE_START        0x17
+#define REG_CACHE_END        0x20
+
  /*
   * Data structures and manipulation thereof
   */
@@ -67,6 +70,7 @@
  struct nct7802_data {
      struct regmap *regmap;
      struct mutex access_lock; /* for multi-byte read and write operations */
+    u8 reg_cache[REG_CACHE_END - REG_CACHE_START + 1];
  };

  static ssize_t show_temp_type(struct device *dev, struct device_attribute *attr,
@@ -467,6 +471,15 @@  static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
      if (ret < 0)
          return ret;

+    /*
+     * For registers cleared on read, use a cache to keep all bits
+     * that are set until they are returned to the caller
+     */
+    if ((sattr->nr >= REG_CACHE_START) && (sattr->nr <= REG_CACHE_END)) {
+        val |= data->reg_cache[sattr->nr - REG_CACHE_START];
+        data->reg_cache[sattr->nr - REG_CACHE_START] = val & ~(1 << bit);
+    }
+
      return sprintf(buf, "%u\n", !!(val & (1 << bit)));
  }

Le 25/11/2019 19:06, Gilles BULOZ a écrit :
> Le 25/11/2019 18:35, Guenter Roeck a écrit :
>> On Mon, Nov 25, 2019 at 04:44:44PM +0000, Gilles Buloz wrote:
>>> Le 25/11/2019 15:31, Guenter Roeck a écrit :
>>>> On 11/25/19 5:13 AM, Gilles Buloz wrote:
>>>>> Hi Guenter,
>>>>>
>>>>> According to the NCT7802Y datasheet, the REG_VOLTAGE_LIMIT_LSB definition is wrong and leads to wrong threshold registers 
>>>>> used. It
>>>>> should be :
>>>>> static const u8 REG_VOLTAGE_LIMIT_LSB[2][5] = {
>>>>>            { 0x46, 0x00, 0x40, 0x42, 0x44 },
>>>>>            { 0x45, 0x00, 0x3f, 0x41, 0x43 },
>>>>> };
>>>>> With this definition, the right bit is set in "Voltage SMI Status Register @0x1e" for each threshold reached (using i2cget to 
>>>>> check)
>>>>>
>>>> Good catch. Care to send a patch ?
>>> As a fix for this is only useful with a fix for the problem below, maybe a single patch for both would be better.
>> Not really. Those are two separate issues. The reported and selected
>> limits are wrong, period. This will require two patches.
> OK
>>>>> But I'm unable to get any "ALARM" reported by the command "sensors" for VSEN1/2/3 = in2,in3,in4 because status for in0 is read
>>>>> before (unless I set "ignore in0" in sensors file). The problem is that status bits in "Voltage SMI Status Register @0x1e" are
>>>>> cleared when reading, and a read is done for each inX processed, so only the first inX has a chance to get its alarm bit set.
>>>>> For this problem I don't see how to fix this easily; just to let you know ...
>>>>>
>>>> One possible fix would be to cache each alarm register and to clear the cache
>>>> either after reading it (bitwise) or after a timeout. The latter is probably
>>>> better to avoid stale information.
>>> As we have status registers cleared at byte level and we want them to be cleared at bit level when each bit is read, I think a 
>>> cache
>>> would be better. I suggest this :
>>> - have a cached value for each status register, by default at 0x00
>>> - when reading a register to get a bit, "OR" its byte value with its cached value, then use its cached value for processing.
>>> - then clear the bit that has been processed from the cached value.
>>>
>> Both methods I suggested would have to involve a cache. The question is
>> when to clear the cache - either clear a bit after reporting it, or
>> clear it after a timeout.
>>
>>> I think a timeout would not be obvious to set : at least the time for sensors to read all info (including when terminal is a serial
>>> line and output is slower) and to deal with possible latencies, but not too long...
>> The timeout would be determined by the chip's conversion rate (register 0x26),
> As I understand, the status must be kept in cache between the first read of status register @1E for in0 (clearing all status 
> bits), and the last read for in4. This duration depends on the "sensors" execution time and I'can see any link with the conversion 
> rate here.
>> or, for simplicity, just be set to one second. I don't immediately see why
>> that would be difficult to implement. Not that it matters much, really;
>> I would accept patches with and without timeout.
>>
>> Guenter
>> .
>>
>
