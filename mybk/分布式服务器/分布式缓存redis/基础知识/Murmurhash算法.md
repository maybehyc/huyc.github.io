# Murmurhash算法

Redis在实现字典时用到了两种不同的哈希算法，MurmurHash便是其中一种（另一种是djb），在Redis中应用十分广泛，包括数据库、集群、哈希键、阻塞操作等功能都用到了这个算法。

MurmurHash2的实现

        unsigned int murMurHash(const void *key, int len)  
            {  
                const unsigned int m = 0x5bd1e995;  
                const int r = 24;  
                const int seed = 97;  
                unsigned int h = seed ^ len;  
                // Mix 4 bytes at a time into the hash  
                const unsigned char *data = (const unsigned char *)key;  
                while(len >= 4)  
                {  
                    unsigned int k = *(unsigned int *)data;  
                    k *= m;   
                    k ^= k >> r;   
                    k *= m;   
                    h *= m;   
                    h ^= k;  
                    data += 4;  
                    len -= 4;  
                }  
                // Handle the last few bytes of the input array  
                switch(len)  
                {  
                    case 3: h ^= data[2] << 16;  
                    case 2: h ^= data[1] << 8;  
                    case 1: h ^= data[0];  
                    h *= m;  
                };  
                // Do a few final mixes of the hash to ensure the last few  
                // bytes are well-incorporated.  
                h ^= h >> 13;  
                h *= m;  
                h ^= h >> 15;  
                return h;  
            }  
