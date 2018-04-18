Return-Path: <tcminyard@gmail.com>
Return-path: <tcminyard@gmail.com>
Sender: Corey Minyard <tcminyard@gmail.com>
Reply-To: minyard@acm.org
Subject: Re: [Openipmi-developer] [PATCH] hwmon:ibm: Change ipmi_user_t to
 struct ipmi_user *
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Corey Minyard <cminyard@mvista.com>,
 openipmi-developer@lists.sourceforge.net,
 "Darrick J . Wong" <darrick.wong@oracle.com>
References: <1524064430-22093-1-git-send-email-minyard@acm.org>
 <20180418161046.GB10227@roeck-us.net>
From: Corey Minyard <minyard@acm.org>
Message-ID: <fdcd4b65-869e-427f-0bd3-16381b0985eb@acm.org>
Date: Wed, 18 Apr 2018 12:18:42 -0500
MIME-Version: 1.0
In-Reply-To: <20180418161046.GB10227@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
List-ID: <linux-hwmon@vger.kernel.org>

On 04/18/2018 11:10 AM, Guenter Roeck wrote:
> On Wed, Apr 18, 2018 at 10:13:50AM -0500, minyard@acm.org wrote:
>> From: Corey Minyard <cminyard@mvista.com>
>>
>> Signed-off-by: Corey Minyard <cminyard@mvista.com>
>> Cc: Darrick J. Wong <darrick.wong@oracle.com>
>> ---
>>   drivers/hwmon/ibmaem.c | 2 +-
>>   drivers/hwmon/ibmpex.c | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> I'm getting rid of this annoying coding style violation, if you
>> could get this in, that would be great.
>>
> Not for 4.17, if that is what you are asking for. Feel free to push it
> as part of a series - for that, you have my
>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
>
> Let me know if you want me to queue it for 4.18.

Thanks.  I'll add it to my queue for 4.18.

-corey

> Guenter
>
>> diff --git a/drivers/hwmon/ibmaem.c b/drivers/hwmon/ibmaem.c
>> index 1f64378..9e92673 100644
>> --- a/drivers/hwmon/ibmaem.c
>> +++ b/drivers/hwmon/ibmaem.c
>> @@ -101,7 +101,7 @@ static struct platform_driver aem_driver = {
>>   struct aem_ipmi_data {
>>   	struct completion	read_complete;
>>   	struct ipmi_addr	address;
>> -	ipmi_user_t		user;
>> +	struct ipmi_user	*user;
>>   	int			interface;
>>   
>>   	struct kernel_ipmi_msg	tx_message;
>> diff --git a/drivers/hwmon/ibmpex.c b/drivers/hwmon/ibmpex.c
>> index 21b9c72..4f7b12b 100644
>> --- a/drivers/hwmon/ibmpex.c
>> +++ b/drivers/hwmon/ibmpex.c
>> @@ -84,7 +84,7 @@ struct ibmpex_bmc_data {
>>   
>>   	struct ipmi_addr	address;
>>   	struct completion	read_complete;
>> -	ipmi_user_t		user;
>> +	struct ipmi_user	*user;
>>   	int			interface;
>>   
>>   	struct kernel_ipmi_msg	tx_message;
>> -- 
>> 2.7.4
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> ------------------------------------------------------------------------------
> Check out the vibrant tech community on one of the world's most
> engaging tech sites, Slashdot.org! http://sdm.link/slashdot
> _______________________________________________
> Openipmi-developer mailing list
> Openipmi-developer@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/openipmi-developer
